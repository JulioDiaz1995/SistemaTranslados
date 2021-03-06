<?php
class ProductData {
	public static $tablename = "product";
	public static $remision = "remision";
	public static $detalle_remision = "detalle_remision";

	public function ProductData(){
		$this->name = "";
		$this->price_in = "";
		$this->price_out = "";
		$this->unit = "";
		$this->user_id = "";
		$this->presentation = "0";
		$this->created_at = "NOW()";
	}

	public function ProductData2(){
		$this->fecha = "";
		$this->de= "";
		$this->para = "";
		$this->Observaciones = "";
		$this->enviado_firma = "";
		$this->transportado_firma = "";
		$this->recibido_firma = "";
		$this->created_at = "NOW()";
	}

	public function getCategory(){ return CategoryData::getById($this->category_id);}

	// metodo para obtener datos de remisiones
	public static function producto_remisiones(){
		$sql = "select * from ".self::$tablename." where unit>0";
		$query = Executor::doit($sql);
		return Model::many($query[0],new ProductData());
	}

	// metodo para obtener datos de remisiones del historial
	public static function producto_remisiones2(){
		$sql = "select * from ".self::$remision;
		$query = Executor::doit($sql);
		return Model::many($query[0],new ProductData());
	}

	public static function detalle_historial_remisiones($id){
		$sql = "SELECT product.*,detalle_remision.id AS id_detalle,detalle_remision.cantidad
		FROM detalle_remision,product 
		WHERE product.id = detalle_remision.id_producto and id_remision =".$id;
		$query = Executor::doit($sql);
		return Model::many($query[0],new ProductData());
	}

	public static function ultima_remision(){
		$sql = "select * from ".self::$remision." where id= (select max(id)from ".self::$remision." )";
		$query = Executor::doit($sql);
		return Model::many($query[0],new ProductData());
	}

	public static function producto_detalles_remisiones(){
		$sql = "SELECT product.*,detalle_remision.id AS id_detalle,detalle_remision.cantidad
					FROM detalle_remision,product 
					WHERE product.id = detalle_remision.id_producto and id_remision = 0";
		$query = Executor::doit($sql);
		return Model::many($query[0],new ProductData());
	}

	public function add(){
		$sql = "insert into ".self::$tablename." (barcode,name,description,price_in,price_out,user_id,presentation,unit,category_id,inventary_min,created_at) ";
		$sql .= "value (\"$this->barcode\",\"$this->name\",\"$this->description\",\"$this->price_in\",\"$this->price_out\",$this->user_id,\"$this->presentation\",\"$this->unit\",$this->category_id,$this->inventary_min,NOW())";
		return Executor::doit($sql);
	}
	
	public function add_with_image(){
		$sql = "insert into ".self::$tablename." (barcode,image,name,description,price_in,price_out,user_id,presentation,unit,category_id,inventary_min) ";
		$sql .= "value (\"$this->barcode\",\"$this->image\",\"$this->name\",\"$this->description\",\"$this->price_in\",\"$this->price_out\",$this->user_id,\"$this->presentation\",\"$this->unit\",$this->category_id,$this->inventary_min)";
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

	public static function borrarRemisiones($id){
		$sql = "delete from ".self::$remision." where id=".$id;
		Executor::doit($sql);
		$sql = "delete from ".self::$detalle_remision." where id_remision=".$id;
		Executor::doit($sql);
	}

// partiendo de que ya tenemos creado un objecto ProductData previamente utilizamos el contexto
	public function update(){
		$sql = "update ".self::$tablename." set barcode=\"$this->barcode\",name=\"$this->name\",price_in=\"$this->price_in\",price_out=\"$this->price_out\",unit=\"$this->unit\",presentation=\"$this->presentation\",category_id=$this->category_id,inventary_min=\"$this->inventary_min\",description=\"$this->description\",is_active=\"$this->is_active\" where id=$this->id";
		Executor::doit($sql);
	}

	public function del_category(){
		$sql = "update ".self::$tablename." set category_id=NULL where id=$this->id";
		Executor::doit($sql);
	}

	public function update_image(){
		$sql = "update ".self::$tablename." set image=\"$this->image\" where id=$this->id";
		Executor::doit($sql);
	}

	public static function getById($id){
		$sql = "select * from ".self::$tablename." where id=$id";
		$query = Executor::doit($sql);
		return Model::one($query[0],new ProductData());
	}

	public static function getByIdRemision($id){
		$sql = "select * from ".self::$remision." where id=$id";
		$query = Executor::doit($sql);
		return Model::one($query[0],new ProductData());
	}

	public static function getAll(){
		$sql = "select * from ".self::$tablename;
		$query = Executor::doit($sql);
		return Model::many($query[0],new ProductData());
	}

	public static function getAllByPage($start_from,$limit){
		$sql = "select * from ".self::$tablename." where id>=$start_from limit $limit";
		$query = Executor::doit($sql);
		return Model::many($query[0],new ProductData());
	}
 
	public static function TraerUbicacion(){
		$sql = "select distinct price_in from  ".self::$tablename;
		$query = Executor::doit($sql);
		return Model::many($query[0],new ProductData());
	}
	
	public static function TraerProductoPorUbicacion($start_from,$limit,$ubicacion){
		$sql = "select * from ".self::$tablename." where id>=$start_from and  price_in like concat('%', '$ubicacion' ,'%') limit $limit";
		$query = Executor::doit($sql);
		return Model::many($query[0],new ProductData());
	}

	public static function getLike($p){
		$sql = "select * from ".self::$tablename." where barcode like '%$p%' or name like '%$p%' or id like '%$p%'";
		$query = Executor::doit($sql);
		return Model::many($query[0],new ProductData());
	}

	public static function getAllByUserId($user_id){
		$sql = "select * from ".self::$tablename." where user_id=$user_id order by created_at desc";
		$query = Executor::doit($sql);
		return Model::many($query[0],new ProductData());
	}

	public static function getAllByCategoryId($category_id){
		$sql = "select * from ".self::$tablename." where category_id=$category_id order by created_at desc";
		$query = Executor::doit($sql);
		return Model::many($query[0],new ProductData());
	}
}

?>