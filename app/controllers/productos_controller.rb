class ProductosController < ApplicationController
  require 'json_web_token'
    skip_before_action :verify_authenticity_token
    def new
      
      
        @producto = Producto.new
      
     end
    
     def create

      
       
       @producto = Producto.new(productos_params)       
       @producto.user_id = current_user.id
       
       if @producto.save
        redirect_to new_producto_path
      else
        render :new
      end
     end
   
     def index
      @productos=Producto.all
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
