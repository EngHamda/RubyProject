class RegistrationsController < Devise::RegistrationsController

	private

	def sign_up_params
		params.require(:user).permit(:name, :email, :password, :password_confirmation, :date_of_birth, :gender, :profile_picture, :admin, :instructor)
	end

	def account_update_params
		params.require(:user).permit(:name, :email, :password, :password_confirmation, :current_password, :date_of_birth, :gender, :profile_picture, :admin, :instructor)
	end
end#don't use it & devise view till now
