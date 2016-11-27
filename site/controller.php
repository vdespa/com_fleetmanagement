<?php
defined('_JEXEC') or die;

class FleetmanagementController extends JControllerLegacy
{
	/**
	 * Method to display a view.
	 *
	 * @param   boolean  $cachable   If true, the view output will be cached.
	 * @param   boolean  $urlparams  An array of safe url parameters and their variable types, for valid values see {@link JFilterInput::clean()}.
	 *
	 * @return  JController  This object to support chaining.
	 *
	 * @since   1.5
	 */
	public function display($cachable = false, $urlparams = false)
	{
		echo '<h2>' . JText::_('COM_FLEETMANAGEMENT_FE_MESSAGE') .'<h2>';
		echo '<h3>NEW TEXT<h3>';
		echo '<img src="'.  JURI::root() .'media/com_fleetmanagement/images/image.png">';
		return $this;
	}
}
