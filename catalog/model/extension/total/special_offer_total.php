<?php
class ModelExtensionTotalSpecialOfferTotal extends Model {
	public function getTotal($total) {
	
        $this->load->language('extension/total/special_offer_total');

        $get_products = $this->cart->getProducts();

        $total_offer_discount = 0;
        if(!isset($_COOKIE['bought_pds']) || !isset($_COOKIE['try_products'])) return false;

        $bought_products = explode(',',$_COOKIE['bought_pds']);
        $try_products = explode(',',$_COOKIE['try_products']);

        $this->load->model('catalog/product');
        $this->load->model('catalog/multimodal');

        foreach ($get_products as $product) {
            if( in_array($product['product_id'], $bought_products) ){
                $getProductInfo = $this->model_catalog_product->getProduct($product['product_id']);
                if(!$getProductInfo) continue;

                $getMinPrice = $this->_getMinOfferPrice($product['price']);
                if(!$getMinPrice) continue;

                foreach($try_products as $key => $item){
                    $getParts = explode(':',$item);

                    if($getParts[0] == $product['product_id']){
                        $total_offer_discount += ( $getParts[1] >= $getMinPrice) ? ($product['price'] - $getParts[1]) : ($product['price'] - $getMinPrice);
                        break;
                    }
                }
            }
        }

        if( $total_offer_discount > 0){
            $total['totals'][] = array(
                'code'       => 'special_offer_total',
				'title'      => $this->language->get('text_special_offer_total'),
                'value'      => -$total_offer_discount,
                'sort_order' => $this->config->get('special_offer_total_sort_order')
            );

			$total['total'] -= $total_offer_discount;
        }
    }

    /**
     * Get minimum available price for offer
     */
    private function _getMinOfferPrice($price)
    {
        $returnPrice = 0;

        $this->load->model('catalog/multimodal');
        $getModals = $this->model_catalog_multimodal->getModals();

        foreach($getModals as $idModal => $modal){
            if($modal['type'] == 'offer'){
                $getModal = $this->model_catalog_multimodal->getModalById($idModal);
                if(!$getModal['discount']) return $returnPrice;

                if($getModal['discount_type'] == 'percent'){
                    $returnPrice = ($price / 100) * $getModal['discount_percent'];
                } else {
                    foreach(explode(',',$getModal['discount_sum']) as $step){
                        $discount = explode(':',$step);
                        if($price < $discount[0]){
                            $returnPrice = $price - $discount[1];
                            break;
                        }
                    }
                }
                return $returnPrice;
            }
        }

        return false;
    }
}