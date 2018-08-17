class Api::V1::ProductosController < Api::V1::BaseController
    require 'json_web_token'
    skip_before_action :verify_authenticity_token    
   def index
    @productos= Producto.order('create_at DESC');
    render json: {status: 'SUCCES', message:'Loaded Article'}

   end   
    def create
       
      producto = Producto.new(productos_params)       
     
      if producto.save
        render json: {status: 'SUCCES', message:'producto', data:producto},status: :ok 
      else
        render json: {status: 'ERROR', message:'Producto no almacenado',data:producto.errors},status: :unprocessable_entity
      end
     end
     private
     def productos_params
       params.require(:producto).permit(:nombre,:descripcion,:estado)
     end
end