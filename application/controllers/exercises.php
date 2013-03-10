<?php

class Exercises_Controller extends Base_Controller {

	public function action_index()
	{

		return Response::eloquent(Exercises::order_by('title', 'asc')->get());
	}

}