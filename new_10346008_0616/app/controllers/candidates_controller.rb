class CandidatesController < ApplicationController
    def index
      @candidates = Candidate.all
    end
    def new
      @candidate = Candidate.new
    end
    def create
      @candidate = Candidate.new(candidate_params)

      if @candidate.save
        # 成功
        redirect_to candidates_path, notice: "新增學生成功!"
      else
        # 失敗
        render :new
      end
    end 
    def edit
      @candidate = Candidate.find_by(id: params[:id])
    end
    def update
      @candidate = Candidate.find_by(id: params[:id])

      if @candidate.update(candidate_params)
        # 成功
        redirect_to candidates_path, notice: "資料更新成功!"
      else
        # 失敗
        render :edit
      end
    end
    def destroy
      @candidate = Candidate.find_by(id: params[:id])
      @candidate.destroy if @candidate
      redirect_to candidates_path, notice: "資料已刪除!"
    end
  
    private
    def candidate_params
      params.require(:candidate).permit(:name, :student, :score)
    end
  
end
