<?php

require_once(DIR_SYSTEM . 'library/additional_pages/abstract_additional_page_controller.class.php');

class ControllerProductAllProducts extends AbstractAdditionalPageController
{
    const PAGE_NAME = AdditionalPageName::ALL_PRODUCTS;

	public $page_name = self::PAGE_NAME;

    public function index()
    {
        $data = $this->data;

        $filter_data = $this->getFilterData($default_sort = 'pd.name', $default_order = 'ASC');

        $results = $this->model_module_additional_pages->getLatest($filter_data);
        $product_total = $this->model_module_additional_pages->getTotalProducts($filter_data, self::PAGE_NAME);
        $data['products'] = $this->getProductsResults($results);

        $data['sort'] = $filter_data['sort'];
        $data['order'] = $filter_data['order'];
        $data['limit'] = $filter_data['limit'];
        $page = $this->getCurrentPageNumber();

        $url = '';
        if (isset($this->request->get['limit'])) {
            $url .= '&limit=' . $this->request->get['limit'];
        }

        $sorts = array();
		
       // $this->appendSortBy($sorts, $url, $this->language->get('text_p.date_modified'), 'p.date_modified', 'DESC');
	//	$this->appendSortBy($sorts, $url, $this->language->get('text_p.date_added'), 'p.date_added', 'DESC');
        $this->appendSortBy($sorts, $url, $this->language->get('text_name_asc'), 'pd.name', 'ASC');
        $this->appendSortBy($sorts, $url, $this->language->get('text_name_desc'), 'pd.name', 'DESC');
        $this->appendSortBy($sorts, $url, $this->language->get('text_price_asc'), 'ps.price', 'ASC');
        $this->appendSortBy($sorts, $url, $this->language->get('text_price_desc'), 'ps.price', 'DESC');


        $data['sorts'] = $sorts;

        $data['limits'] = $this->getLimits();

        $this->applyPagination($data, $product_total, $page, $data['limit']);

        $this->loadPageElements($data);

        $this->setOutput($data);
    }
}
