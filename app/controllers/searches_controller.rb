class SearchesController < ApplicationController

    API='http://api.magicthegathering.io/v1/cards?'

    def cards
        url=API
        params.each {|k,v| url.concat(k+'='+v.to_s+';')}
        resp=HTTParty.get(url)
        if resp
            # if resp.length>1
                # puts 'Tossing cookie...'
                # cards
            # else
                render json: resp, status: :ok
            # end
        else
            render json: {errors: 'Could not fetch cards from WotC server'}, status: :not_found
        end
    end
    
    private

    def search_params
        params.require(:search)
    end
end