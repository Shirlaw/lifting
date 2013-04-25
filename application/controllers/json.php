<?php

class Json_Controller extends Controller {

  public $restful = true;

  public function get_all() {
    $array = array();

    $array['exercises'] = DB::table('exercises')->get();
    $array['previous'] = DB::table('previous')->get();
    $array['weight'] = DB::table('weight')->get();
    //var_dump($exercises);
    //$array[0] = Response::eloquent(Exercises::order_by('title', 'asc')->get());
    // var_dump($array);
    $array = json_encode($array);
    return $array;
    //return Response::eloquent(Exercises::order_by('title', 'asc')->get());
  }

  public function post_home() {
    $exercise = Input::json();
    $title = $exercise->title;
    $id = DB::table('exercises')->insert_get_id(
      array(
        'title' => $title,
      )
    );

    return $id;
  }

  public function delete_home($id = null) {
    $affected = DB::table('exercises')->delete($id);
    $affected = DB::table('previous')->where('exercise_id', '=', $id)->delete();
  }
  
  public function get_exercise($id = null) {
    $exercise = DB::table('previous')
      ->where('exercise_id', '=', $id)
      ->order_by('id', 'ASC')
      ->get();

    $json = json_encode($exercise);
    return $json;
  }

  public function post_exercise() {
    $exercise = Input::json();

    $exerciseId = $exercise->exerciseId;
    $dateF = $exercise->dates;
    $reps = $exercise->reps;
    $weight = $exercise->weight;

    $id = DB::table('previous')->insert_get_id(
      array(
        'exercise_id' => $exerciseId,
        'dates' => $dateF,
        'reps' => $reps,
        'weight' => $weight
      )
    );

    return $id;
  }

  public function delete_exercise($id = null) {
      $affected = DB::table('previous')->delete($id);
      return $id;
  }

  public function get_weight() {
    $weight = DB::table('weight')
      ->order_by('id', 'ASC')
      ->get();
    $query = "SELECT * FROM weight ORDER BY id ASC";

    $json = json_encode($weight);
    return $json;
  }

  public function post_weight() {
    $weight = Input::json();

    $dates = $weight->dates;
    $weight = $weight->weight;

    $id = DB::table('weight')->insert_get_id(
      array(
        'dates' => $dates,
        'weight' => $weight
      )
    );

    return $id;
  }

  public function delete_weight($id = null) {
    $affected = DB::table('weight')->delete($id);
  }

}