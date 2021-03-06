<?php
/**
 * @package admin
 * @copyright Copyright 2003-2016 Zen Cart Development Team
 * @copyright Portions Copyright 2003 osCommerce
 * @license http://www.zen-cart.com/license/2_0.txt GNU Public License V2.0
 * @version $Id: prod_cat_header_code.php 3009 2006-02-11 15:41:10Z wilt $
 */
if (!defined('IS_ADMIN_FLAG')) {
  die('Illegal Access');
}

  $currencies = new currencies();

  $product_type = (isset($_POST['products_id']) ? zen_get_products_type($_POST['products_id']) : isset($_GET['product_type']) ? $_GET['product_type'] : 1);

  $type_admin_handler = $zc_products->get_admin_handler($product_type);

// make array for product types

  $sql = "select * from " . TABLE_PRODUCT_TYPES;
  $product_types = $db->Execute($sql);
  while (!$product_types->EOF) {
    $product_types_array[] = array('id' => $product_types->fields['type_id'],
                                   'text' => $product_types->fields['type_name']);
    $product_types->MoveNext();
  }
