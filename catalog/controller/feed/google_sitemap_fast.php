<?php
class ControllerFeedGoogleSitemapFast extends Controller {
	protected $categories = array();

	public function index() {
		if ($this->config->get('google_sitemap_status')) {
			$time_start = microtime(true);

			$output = '<?xml version="1.0" encoding="UTF-8"?>';
			$output .= '<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">';

			$this->load->model('tool/sitemap');
			$products = $this->model_tool_sitemap->getProducts();

			foreach($products as $product) {
				$output .= '<url>';
				$output .= '<loc>' . str_replace('&', '&amp;', str_replace('&amp;', '&', $this->url->link('product/product', 'product_id=' . $product['product_id']))) . '</loc>';
				$output .= '<lastmod>' . $product['date'] . '</lastmod>';
				$output .= '<changefreq>weekly</changefreq>';
				$output .= '<priority>1.0</priority>';											
				$output .= '</url>';
			}

			$this->categories = $this->model_tool_sitemap->getAllCategories();

			$output .= $this->getAllCategories(0);


			$informations = $this->model_tool_sitemap->getInformations();

			foreach($informations as $information) {
				$output .= '<url>';
				$output .= '<loc>' . str_replace('&', '&amp;', str_replace('&amp;', '&', $this->url->link('information/information', 'information_id=' . $information['information_id']))) . '</loc>';
				$output .= '<changefreq>weekly</changefreq>';
				$output .= '<priority>0.9</priority>';
				$output .= '</url>';
			}
			
			
			
$this->load->model('newsblog/article');

			$articles = $this->model_newsblog_article->getArticles();

			foreach ($articles as $article) {
					$output .= '<url>';
					$output .= '<loc>' . $this->url->link('newsblog/article', 'newsblog_article_id=' . $article['article_id']) . '</loc>';
					$output .= '<changefreq>weekly</changefreq>';
					$output .= '<lastmod>' . date('Y-m-d\TH:i:sP', strtotime($article['date_modified'])) . '</lastmod>';
					$output .= '<priority>0.9</priority>';
					$output .= '</url>';
					$output .= "\n";
			}

			$this->load->model('newsblog/category');

			$output .= $this->getCategories(0);
			
			
			
			
			$output .= '</urlset>';

			$this->log->write(sprintf("Fast Sitemap Execution Time: %05.5f", (microtime(true) - $time_start)));

			$this->response->addHeader('Content-Type: application/xml');
			$this->response->setOutput($output);
		}
	}

	protected function getAllCategories($parent_id = 0, $current_path = '') {
		$output = '';

		if(array_key_exists($parent_id, $this->categories)) {
			$results = $this->categories[$parent_id];

			foreach($results as $result) {
				if(!$current_path) {
					$new_path = $result['category_id'];
				} else {
					$new_path = $current_path . '_' . $result['category_id'];
				}

				$output .= '<url>';
				$output .= '<loc>' . str_replace('&', '&amp;', str_replace('&amp;', '&', $this->url->link('product/category', 'path=' . $new_path))) . '</loc>';
				$output .= '<lastmod>' . $result['date'] . '</lastmod>';
				$output .= '<changefreq>weekly</changefreq>';
				$output .= '<priority>1.0</priority>';
				$output .= '</url>';

				if(!$current_path) {
					$new_path = $result['category_id'];
				} else {
					$new_path = $current_path . '_' . $result['category_id'];
				}

				$children = '';

				if(array_key_exists($result['category_id'], $this->categories)) {
					$children = $this->getAllCategories($result['category_id'], $new_path);
				}

				$output .= $children;

			}
		}
		return $output;
	}
	protected function getCategories($parent_id, $current_path = '') {
		$output = '';

		$results = $this->model_newsblog_category->getCategories($parent_id);

		foreach ($results as $result) {
			if (!$current_path) {
				$new_path = $result['category_id'];
			} else {
				$new_path = $current_path . '_' . $result['category_id'];
			}

			$output .= '<url>';
			$output .= '<loc>' . $this->url->link('newsblog/category', 'newsblog_path=' . $new_path) . '</loc>';
			$output .= '<changefreq>weekly</changefreq>';
			$output .= '<priority>0.8</priority>';
			$output .= '</url>';

			$output .= $this->getCategories($result['category_id'], $new_path);
		}

		return $output;
	}
}
?>