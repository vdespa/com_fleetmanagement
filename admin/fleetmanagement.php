<?php
defined('_JEXEC') or die;

$controller = JControllerLegacy::getInstance('Fleetmanagement');
$controller->execute(JFactory::getApplication()->input->get('task'));
$controller->redirect();
