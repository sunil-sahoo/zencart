<?php
/**
 * Class Columnar
 *
 * @copyright Copyright 2003-2015 Zen Cart Development Team
 * @license http://www.zen-cart.com/license/2_0.txt GNU Public License V2.0
 * @version $Id: currencies.php 15880 2010-04-11 16:24:30Z wilt $
 */
namespace ZenCart\ListingQueryAndOutput\formatters;

/**
 * Interface FormatterInterface
 * @package ZenCart\ListingQueryAndOutput\formatters
 */
interface FormatterInterface
{
    public function format();
}
