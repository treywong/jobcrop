class LanguagesController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @language = @user.languages.build(language_params)

    if @language.save
      flash[:success] = "Language added."
      redirect_back(fallback_location: @user)
    else
      flash[:danger] = "Something's wrong. #{@language.errors.full_messages.to_sentence}"
      redirect_back(fallback_location: @user)
    end
  end

  def edit
    @user = User.find(params[:user_id])
    @language = Language.find(params[:id])
    respond_to do |format|
      format.js
    end
  end

  def update
    @user = User.find(params[:user_id])
    @language = Language.find(params[:id])
    @languages = @user.languages

    if @language.update(language_params)
      flash[:success] = "Language updated."
      respond_to do |format|
        format.js
      end
    else
      flash[:danger] = "Something's wrong. #{@language.errors.full_messages.to_sentence}"
      redirect_back(fallback_location: @user)
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @language = Language.find(params[:id])

    @language.destroy
    redirect_back(fallback_location: @user)
  end

  private
  def language_params
    params.require(:language).permit(
      :dialect,
      :native,
      :writing,
      :speaking
    )
  end
end
