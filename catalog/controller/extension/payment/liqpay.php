<?php
class ControllerExtensionPaymentLiqPay extends Controller {
    public function index() {
        $data['button_confirm'] = $this->language->get('button_confirm');
        $result_url = $this->url->link('extension/payment/liqpay/renderstatus', '', 'SSL');
        $order_id = $this->session->data['order_id'];
        $this->load->model('checkout/order');
        $order_info = $this->model_checkout_order->getOrder($this->session->data['order_id']);


        $server_url  = $this->url->link('extension/payment/liqpay/callback', '', 'SSL');
        $private_key = $this->config->get('liqpay_signature');
        $public_key  = $this->config->get('liqpay_merchant');
        $sandbox     = ($this->config->get('liqpay_sandbox') == 'sandbox') ? '1' : '0' ;

        $liqpay = new LiqPay($public_key, $private_key);
        $html = $liqpay->cnb_form(array(
            'version'        => '3',
            'action'         => 'pay',
            'amount'         => $this->currency->format($order_info['total'], $order_info['currency_code'], $order_info['currency_value'], false),
            'currency'       => $order_info['currency_code'],
            'description'    => 'Order: '.$order_id,
            'order_id'       => $order_id,
            'result_url'     => $result_url,
            'server_url'     => $server_url,
            'sandbox'        => $sandbox
        ));

        return  $html;
    }


public function renderstatus() {
if ( $this->request->post ) {
$data = $this->request->post['data'];
$parsed_data = json_decode(base64_decode($data), true);

if($parsed_data['status'] == 'success' || $parsed_data['status'] == 'sandbox' ){
$this->response->redirect($this->url->link('checkout/success', '', 'SSL'));}

 else {
$this->response->redirect($this->url->link('checkout/failure', '', 'SSL'));
}
}
}



    public function callback() {

        $private_key = $this->config->get('liqpay_signature');

        $data        = $this->request->post['data'];
        $signature   = $this->request->post['signature'];

        $sign_check  = base64_encode(sha1($private_key . $data . $private_key, 1));
        $parsed_data = json_decode(base64_decode($data), true);

        $status = ($parsed_data['status'] == 'success' || $parsed_data['status'] == 'sandbox') ? $this->config->get('liqpay_success_status_id') : $this->config->get('liqpay_failure_status_id');


        if ($sign_check == $signature) {
            $this->load->model('checkout/order');
            $this->model_checkout_order->addOrderHistory($parsed_data['order_id'], $status);
        }

    }



}