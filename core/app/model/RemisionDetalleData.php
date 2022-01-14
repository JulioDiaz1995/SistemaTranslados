<?php
class RemisionDetalleData {

	public static $tablename = "detalle_remision";

	public function RemisionDetalleData(){
		$this->id_producto = "";
		$this->cantidad = "";
		$this->id_remision = "";
	}

	// metodo para obtener datos de remisiones
	public static function producto_remisiones(){
		$sql = "select * from ".self::$tablename." where cantidad>0";
		$query = Executor::doit($sql);
		return Model::many($query[0],new ProductData());
	}

	public function add(){
		$sql = "insert into ".self::$tablename." (id_producto,cantidad,id_remision) ";
		$sql .= "value (\"$this->id_producto\",\"$this->cantidad\",\"$this->id_remision\"())";
		return Executor::doit($sql);
	}

	public static function delById($id){
		$sql = "delete from ".self::$tablename." where id=$id";
		Executor::doit($sql);
	}
	public function del(){
		$sql = "delete from ".self::$tablename." where id=$this->id";
		Executor::doit($sql);
	}

	public function update(){
		$sql = "update ".self::$tablename." set id_producto=\"$this->id_producto\",cantidad=\"$this->cantidad\",id_remision=\"$this->id_remision,\" where id=$this->id";
		Executor::doit($sql);
	}

	public function del_category(){
		$sql = "update ".self::$tablename." set category_id=NULL where id=$this->id";
		Executor::doit($sql);
	}

	public static function getById($id){
		$sql = "select * from ".self::$tablename." where id=$id";
		$query = Executor::doit($sql);
		return Model::one($query[0],new ProductData());
	}

	public static function getAll(){
		$sql = "select * from ".self::$tablename;
		$query = Executor::doit($sql);
		return Model::many($query[0],new ProductData());
	}

	public static function getAllByid_producto($id_producto){
		$sql = "select * from ".self::$tablename." where id_producto=$id_producto order by created_at desc";
		$query = Executor::doit($sql);
		return Model::many($query[0],new ProductData());
	}

	public static function getAllByid_remisiond($id_remision){
		$sql = "select * from ".self::$tablename." where id_remision=$id_remision order by created_at desc";
		$query = Executor::doit($sql);
		return Model::many($query[0],new ProductData());
	}
}

?>