class SearchesController < ApplicationController

    API='http://api.magicthegathering.io/v1/cards?'

    def cards
        url=API
        params.each {|k,v| API.concat(k+'='+v.to_s+';')}
        resp=HTTParty.get(API)
        if resp
            array=resp.map{ |k,v| v}
            render json: {cards:array, heads:resp.headers}, status: :ok
        else
            render json: {errors: 'No response from WotC server'}, status: :not_found
        end
    end
    
    private

    def search_params
        params.require(:search)
    end
end