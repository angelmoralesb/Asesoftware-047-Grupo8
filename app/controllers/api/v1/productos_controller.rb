class Api::V1::ProductosController < Api::V1::BaseController
    require 'json_web_token'
    respond_to :json
    skip_before_action :verify_authenticity_token   
    
   def index
    @productos= Producto.order('id');
    json_response={
      producto: @productos
    }
    respond_with json_response, callback:params[:callback]
    

   end   
    def create
       
      producto = Producto.new(productos_params)       
      producto.user_id = @current_user
      if producto.save
        render json: {status: 'SUCCES', message:'producto', data:producto},status: :ok 
      else
        render json: {status: 'ERROR', message:'Producto no almacenado',data:producto.errors},status: :unprocessable_entity
      end
     end
     def show
      @productos=Producto.find(params[:id])
       #@producto = EcoProducto.find(params[:id])
     end
     private
     def productos_params
       params.require(:producto).permit(:nombre,:descripcion,:estado)
     end
end