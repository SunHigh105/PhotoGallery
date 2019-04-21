<?php

class My_Smarty extends Smarty{
    function __construct(){

        $this->template_dir = './templates/';
        $this->compile_dir  = './templates_c/';
        $this->left_delimiter = '<%';
        $this->right_delimiter = '%>';
    }

    public function view($arr, $file){
        
        parent::__construct();
        $this->assign($arr);
        $this->display($file);
    }
}