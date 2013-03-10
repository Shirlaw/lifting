<?php

class Json_Controller extends Controller {

  public $restful = true;

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
  }
  
  public function get_exercise($id = null) {
    $query = "SELECT * FROM previous WHERE exercise_id=" . $id . " ORDER BY id ASC";
    $posts = DB::query($query);
    $json = json_encode($posts);
    //return $query;
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


}