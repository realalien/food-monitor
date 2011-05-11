class BasicController < ApplicationController
  def search
  end


  def handle_barcode_search
    if params[:barcode]
      # TODO: sanity check
      @p = ProductDetail.find_by_barcode(params[:barcode] )
      if @p
        # render a product detail page with user interaction()
        render :text => "find existing product with #{params[:barcode]}"
      else
        # render a product detail entry mode
        render new_product_detail_path
      end
    end
  end
end
