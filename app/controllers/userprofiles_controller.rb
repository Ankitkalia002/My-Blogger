class UserprofilesController < ApplicationController

def edit
	@user =User.find(current_user.id)
    @userprofile =User.find (current_user.id)

end
def update
	@user =User.find(current_user.id)
    @user.name =params[:name]
    @user.dob =params[:dob]
    @user.gender =params[:gender]
    @user.city =params[:city]
    @user.address =params[:address]
    @user.photo =params[:photo]
    @user.save
    redirect_to userprofile_path



end
def show
	@userprofile =User.find (current_user.id)
end
end
