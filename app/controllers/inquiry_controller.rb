class InquiryController < ApplicationController
def index
    # 入力画面を表示
    if session[:inquiry]
    @inquiry = Inquiry.new session[:inquiry]
    reset_session
  else
    @inquiry = Inquiry.new session[:inquiry]
    render :action => 'index'
  end
end

# def destroy
#   reset_session
#   redirect_to inquiry_url
# end

  def confirm
    # 入力値のチェック
    session[:inquiry] = params[:inquiry]
    @inquiry = Inquiry.new(inquiry_params)
    if @inquiry.valid?
      # OK。確認画面を表示
      render :action => 'confirm'
    else
      # NG。入力画面を再表示
      render :action => 'index'
    end
  end

  def thanks
    # メール送信
    @inquiry = Inquiry.new(inquiry_params)
    if @inquiry.save
      Inquirymailer.received_email(@inquiry).deliver
      #メールを送信したらsessionを消去する。
      # session[:inquiry] = nil
      reset_session
    end

    # 完了画面を表示
    render :action => 'thanks'
  end

  def destroy
    @inquiry = Inquiry.new(inquiry_params)
    session[:inquiry] = nil
    redirect_to inquiry_url
  end

  private
  def inquiry_params
    params.require(:inquiry).permit(
      :name,
      :email,
      :phone,
      :message,
      :service,
      :recruit,
      :media
      )
  end
end
