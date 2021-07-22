class Api::V1::FactsController < ApplicationController
    
    # GET /facts
    def index
        @facts = Fact.all
        render json: @facts
    end 

    # GET /facts/:id
    def show
        @fact = Fact.find(params[:id])
        render json: @fact
    end 

    # POST /facts
    def create
        @fact = Fact.new(fact_params)
        if @fact.save
            render json: @fact
        else 
            render error: { error: 'Unable to create fact' }, status: 400
        end
    end 

    # PUT /facts/:id
    def update
        @fact = Fact.find(params[:id])
        if @fact
            @fact.update(fact_params)
            render json: { message: 'Fact successfully updated'}, status: 200
        else 
            render error: { error: 'Unable to udpate fact' }, status: 400
        end
    end

    # DELETE /facts/:id
    def destroy
        @fact = Fact.find(params[:id])
        if @fact
            @fact.destroy
            render json: { message: 'Fact successfully deleted'}, status: 200
        else 
            render error: { error: 'Unable to delete fact' }, status: 400
        end
    end

    private

    def fact_params
        params.require(:fact).permit(:factname, :password)
    end

end
