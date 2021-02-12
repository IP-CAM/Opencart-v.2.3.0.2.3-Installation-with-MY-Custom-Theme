<?php
class ControllerCatalogMultiModalRequests extends Controller
{
    private $error = array();

    public function index()
    {
        setlocale(LC_ALL, 'ru_RU.UTF-8');

        $this->document->addStyle('view/stylesheet/multimodals.css');
        $this->document->addStyle('https://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800&subset=latin,cyrillic');
        $this->document->addStyle('https://fonts.googleapis.com/icon?family=Material+Icons');

        $this->language->load('catalog/multimodal');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('catalog/multimodal');

        $this->getList();
    }

    protected function getList() {

        $data = $this->language->load('catalog/multimodal');

        if (isset($this->request->get['sort'])) {
            $sort = $this->request->get['sort'];
        } else {
            $sort = 'name';
        }

        if (isset($this->request->get['order'])) {
            $order = $this->request->get['order'];
        } else {
            $order = 'DESC';
        }

        if (isset($this->request->get['page'])) {
            $page = $this->request->get['page'];
        } else {
            $page = 1;
        }

        $url = '';

        if (isset($this->request->get['sort'])) {
            $url .= '&sort=' . $this->request->get['sort'];
        }

        if (isset($this->request->get['order'])) {
            $url .= '&order=' . $this->request->get['order'];
        }

        if (isset($this->request->get['page'])) {
            $url .= '&page=' . $this->request->get['page'];
        }

        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text'      => $this->language->get('text_home'),
            'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
            'separator' => false
        );

        $data['breadcrumbs'][] = array(
            'text'      => $this->language->get('heading_title'),
            'href'      => $this->url->link('catalog/multimodal_requests', 'token=' . $this->session->data['token'] . $url, 'SSL'),
            'separator' => ' :: '
        );

        $data['delete'] = $this->url->link('catalog/multimodal_requests/delete', 'token=' . $this->session->data['token'] . $url, 'SSL');

        $data['requests'] = array();

        $dataFilter = array(
            'sort'  => $sort,
            'order' => $order,
            'start' => ($page - 1) * $this->config->get('config_admin_limit'),
            'limit' => $this->config->get('config_admin_limit')
        );

        $requests_total = $this->model_catalog_multimodal->getTotalRequests();

        $results = $this->model_catalog_multimodal->getRequests($dataFilter);

        $this->load->model('user/user');

        foreach ($results as $result) {
            $time = strtotime(str_replace('-','/', $result['date_add']));
            $data['requests'][] = array(
                'request_id' => $result['id'],
                'name_form'  => $result['name_form'],
                'email'      => $result['email'],
                'telephone' => $result['telephone'],
                'fields' =>$result['fields'],
                'url' => htmlspecialchars($result['url']),
                'manager' => $this->model_user_user->getUser($result['manager_id']),
                'manager_comment' => $result['manager_comment'],
                'date_add' => (date('Y-m-d') == date('Y-m-d',$time)) ? (strftime('%H:%M', $time).' '.$data['text_today']) : strftime('%H:%M, %u %h', $time),
                'ip_address' => $result['ip_address'],
                'status' => $result['status'],
                'text_status' => $data['status_'.$result['status']],
                'selected'  => isset($this->request->post['selected']) && in_array($result['request_id'], $this->request->post['selected']),
            );
        }

        $data['heading_title'] = $this->language->get('heading_title');

        if (isset($this->error['warning'])) {
            $data['error_warning'] = $this->error['warning'];
        } else {
            $data['error_warning'] = '';
        }

        if (isset($this->session->data['success'])) {
            $data['success'] = $this->session->data['success'];

            unset($this->session->data['success']);
        } else {
            $data['success'] = '';
        }

        $url = '';

        if ($order == 'ASC') {
            $url .= '&order=DESC';
        } else {
            $url .= '&order=ASC';
        }

        if (isset($this->request->get['page'])) {
            $url .= '&page=' . $this->request->get['page'];
        }

        $data['sort_name'] = $this->url->link('catalog/multimodal_requests', 'token=' . $this->session->data['token'] . '&sort=name' . $url, 'SSL');
        $data['sort_date_add'] = $this->url->link('catalog/multimodal_requests', 'token=' . $this->session->data['token'] . '&sort=date_add' . $url, 'SSL');
        $data['save_comment'] = str_replace('amp;','',$this->url->link('catalog/multimodal_requests/saveComment', 'token=' . $this->session->data['token'] , 'SSL'));
        $data['change_status'] = str_replace('amp;','',$this->url->link('catalog/multimodal_requests/changeStatus', 'token=' . $this->session->data['token'] , 'SSL'));
        $data['remove'] = str_replace('amp;','',$this->url->link('catalog/multimodal_requests/remove', 'token=' . $this->session->data['token'] , 'SSL'));
        $url = '';

        if (isset($this->request->get['sort'])) {
            $url .= '&sort=' . $this->request->get['sort'];
        }

        if (isset($this->request->get['order'])) {
            $url .= '&order=' . $this->request->get['order'];
        }

        $pagination = new Pagination();
        $pagination->total = $requests_total;
        $pagination->page = $page;
        $pagination->limit = $this->config->get('config_admin_limit');
        $pagination->text = $this->language->get('text_pagination');
        $pagination->url = $this->url->link('catalog/multimodal_requests', 'token=' . $this->session->data['token'] . $url . '&page={page}', 'SSL');

        $data['pagination'] = $pagination->render();

        $data['sort'] = $sort;
        $data['order'] = $order;


        $data['header'] = $this->load->controller('common/header');
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['footer'] = $this->load->controller('common/footer');

        $this->response->setOutput($this->load->view('catalog/multimodal_list.tpl', $data));
    }

    public function saveComment()
    {
        $this->load->model('catalog/multimodal');
        $this->model_catalog_multimodal->saveComment($this->request->post['request_id'], $this->request->post['comment']);
    }

    public function changeStatus()
    {
        $this->load->model('catalog/multimodal');
        $this->model_catalog_multimodal->changeStatus($this->request->post['request_id'], $this->request->post['status']);
    }

    public function remove()
    {
        $this->load->model('catalog/multimodal');
        $this->model_catalog_multimodal->removeRequest($this->request->post['request_id']);
    }
}
