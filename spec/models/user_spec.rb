require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
  it "全ての項目が入力されていれば登録できる" do
      expect(@user).to be_valid
  end

  it "passwordが6文字以上で英数混合であれば登録できる" do
      @user.password = "ha0000"
      @user.password_confirmation = "ha0000"
      expect(@user).to be_valid
    end
 end
end

 context '新規登録がうまくいかないとき' do
 it "nicknameが空だと登録できない" do
  @user.nickname = ""
  @user.valid?
  expect(@user.errors.full_messages).to include("Nickname can't be blank")
  end

 it "mailアドレスが空だと登録できない" do
  @user.email = ""
  @user.valid?
  expect(@user.errors.full_messages).to include("Email can't be blank")
 end
 
 it "重複したemailが存在する場合登録できないこと" do
  @user.save
  another_user = FactoryBot.build(:user)
  another_user.email = @user.email
  another_user.valid?
  expect(another_user.errors.full_messages).to include("Email has already been taken")
 end
 
 it "メールアドレスは@を含む必要があること" do
  @user.email = "kkk"
  @user.valid?
  expect(@user.errors.full_messages).to include("Email is invalid")
 end
 
 it "passwordが空では登録できない" do
  @user.password = ""
  @user.valid?
  expect(@user.errors.full_messages).to include("Password can't be blank")
 end
 
 it "passwordが5文字以下では登録できない" do
  @user.password = "ha000"
  @user.password_confirmation = "ha000"
  @user.valid?
  expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
 end

  it "passwordに半角数字が含まれない場合登録できない" do
    @user.password = "aaaaaa"
    @user.password_confirmation = "aaaaaa"
    @user.valid?
    expect(@user.errors.full_messages).to include("Password は英数混合で入力してください。")
  end
 
  it "passwordに半角英語が含まれない場合登録できない" do
    @user.password = "222222"
    @user.password_confirmation = "222222"
    @user.valid?
    expect(@user.errors.full_messages).to include("Password は英数混合で入力してください。")
  end

 it "passwordが存在してもpassword_confirmationが空では登録できない" do
  @user.password_confirmation = ""
  @user.valid?
  expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")

 end


it "first_nameが空だと登録できないこと" do
  @user.first_name = ""
  @user.valid?
  expect(@user.errors.full_messages).to include("First name can't be blank")
end

it "first_nameが半角だと登録できないこと" do
 @user.first_name = "aaaaaa"
 @user.valid?
 expect(@user.errors.full_messages).to include("First name は全角で入力して下さい。")
end

 it "last_nameが空だと登録できないこと" do
  @user.last_name = ""
  @user.valid?
  expect(@user.errors.full_messages).to include("Last name can't be blank")
end

it "last_nameが半角だと登録できないこと" do
@user.last_name = "aaaaaa"
 @user.valid?
 expect(@user.errors.full_messages).to include("Last name は全角で入力して下さい。")
end

 it "first_name_kanaが空だと登録できないこと" do
  @user.first_name_kana = ""
  @user.valid?
  expect(@user.errors.full_messages).to include("First name kana can't be blank")
  end

 it "first_name_kanaが全角カタカナでないと登録できないこと" do
  @user.first_name_kana = "ああああ"
  @user.valid?
  expect(@user.errors.full_messages).to include("First name kana はカタカナで入力して下さい。")
end
 
it "last_name_kanaが空だと登録できないこと" do
  @user.last_name_kana = ""
  @user.valid?
  expect(@user.errors.full_messages).to include("Last name kana can't be blank")
  end
 
  it "last_name_kanaが全角カタカナでないと登録できないこと" do
  @user.last_name_kana = "ああああ"
  @user.valid?
  expect(@user.errors.full_messages).to include("Last name kana はカタカナで入力して下さい。")
 end

 it "birthdayが空だと登録できないこと" do
  @user.birthday = ""
  @user.valid?
  expect(@user.errors.full_messages).to include("Birthday can't be blank")
end
end
end



