<?php
class RemisionData {

	public static $tablename = "remision";

	public function RemisionData(){
		$this->fecha = "";
		$this->de = "";
		$this->para = "";
		$this->observaciones = "";
		$this->enviado_firma = "";
		$this->transportado_firma = ""; 
        $this->recibido_firma = "";
	}

	// metodo para obtener datos de remisiones
	public static function producto_remisiones(){
		$sql = "select * from ".self::$tablename." where unit>0";
		$query = Executor::doit($sql);
		return Model::many($query[0],new ProductData());
	}

	public function add(){
		$sql = "insert into ".self::$tablename." (fecha,de,para,observaciones,enviado_firma,transportado_firma ,recibido_firma) ";
		$sql .= "value (\"$this->fecha\",\"$this->de\",\"$this->para\",\"$this->observaciones\",\"$this->enviado_firma\",$this->transportado_firma,\"$this->recibido_firma\",NOW())";
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
		$sql = "update ".self::$tablename." set fecha=\"$this->fecha\",de=\"$this->de\",para=\"$this->para\",observaciones=\"$this->observaciones\",enviado_firma=\"$this->enviado_firma\",transportado_firma=\"$this->transportado_firma\",recibido_firma=$this->recibido_firma\" where id=$this->id";
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