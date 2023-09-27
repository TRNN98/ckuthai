import 'package:appbase/class/myclass.dart';

class Language {
  // MainMenu
  static menuLg(m, l) {
    if (m == 'share') {
      return l == 'en' ? "Share" : "ทุนเรือนหุ้น";
    }
    if (m == 'loan') {
      return l == 'en' ? "Loan" : "หนี้เงินกู้";
    }
    if (m == 'deposit') {
      return l == 'en' ? "Deposit" : "เงินฝาก";
    }
    if (m == 'guarantee') {
      return l == 'en' ? "Guarantee" : "ผู้ค้ำประกัน";
    }
    if (m == 'kept') {
      return l == 'en' ? "Billed Monthly" : "เรียกเก็บ\nรายเดือน";
    }
    if (m == 'dividend') {
      return l == 'en' ? "Dividend" : "ปันผล\nเฉลี่ยคืน";
    }
    if (m == 'gain') {
      return l == 'en' ? "Beneficiary" : "ผู้รับผล\nประโยชน์";
    }
    if (m == 'cremation') {
      return l == 'en' ? "สมาคมฌาปนกิจ" : "สมาคมฌาปนกิจ";
    }
    if (m == 'welcome') {
      return l == 'en' ? "Welcome" : "ยินดีต้อนรับ";
    }
  }

  static shareLg(m, l) {
    if (m == 'member') {
      return l == 'en' ? "Membership" : "ทะเบียนสมาชิก";
    }
    if (m == 'name') {
      return l == 'en' ? "Name" : "ชื่อ - สกุล";
    }
    if (m == 'share') {
      return l == 'en' ? "Share" : "ทุนเรือนหุ้น";
    }
    if (m == 'period') {
      return l == 'en' ? "Period" : "งวดล่าสุด";
    }
    if (m == 'monthlyShare') {
      return l == 'en' ? "Monthly share" : "หุ้นรายเดือน";
    }
    if (m == 'date') {
      return l == 'en' ? "Date" : "วันที่";
    }
    if (m == 'period1') {
      return l == 'en' ? "Period" : "งวด";
    }
    if (m == 'amount') {
      return l == 'en' ? "Amount" : "จำนวน";
    }
  }

  static loanLg(m, l) {
    if (m == 'member') {
      return l == 'en' ? "Membership" : "ทะเบียนสมาชิก";
    }
    if (m == 'name') {
      return l == 'en' ? "Name" : "ชื่อ - สกุล";
    }
    if (m == 'detail') {
      return l == 'en' ? "Detail" : "รายละเอียด";
    }
    if (m == 'amount') {
      return l == 'en' ? "Amount" : "จำนวนเงิน";
    }
    if (m == 'loan') {
      return l == 'en' ? "Loan" : "หนี้เงินกู้";
    }
    if (m == 'contractStartDate') {
      return l == 'en' ? "Contract start date  " : "วันที่เริ่มสัญญา  ";
    }
    if (m == 'period') {
      return l == 'en' ? "Period  " : "งวดล่าสุด  ";
    }
    if (m == 'period1') {
      return l == 'en' ? "Period" : "งวด";
    }
    if (m == 'amount') {
      return l == 'en' ? "Amount" : "จำนวนเงิน";
    }
    if (m == 'paymentInInstallments') {
      return l == 'en' ? "Payment installments: " : "ชำระงวดละ: ";
    }
    if (m == 'loanContractInformation') {
      return l == 'en' ? "Loan contract information" : "ข้อมูลสัญญาเงินกู้";
    }
    if (m == 'listOfLoanAgreements') {
      return l == 'en' ? "List of loan agreements" : "รายการสัญญาเงินกู้";
    }
    if (m == 'loanContractNumber') {
      return l == 'en' ? "Loan contract number" : "เลขที่สัญญาเงินกู้";
    }
    if (m == 'approvalLimit') {
      return l == 'en' ? "Approval limit" : "วงเงินอนุมัติ";
    }
    if (m == 'periodAll') {
      return l == 'en' ? "Period All" : "จำนวนงวด";
    }
    if (m == 'payment') {
      return l == 'en' ? "Payment" : "การชำระ";
    }
    if (m == 'balance') {
      return l == 'en' ? "Balance" : "ยอดคงเหลือ";
    }
    if (m == 'showGuarantees') {
      return l == 'en' ? "Guarantees" : "หลักประกันเงินกู้";
    }
    if (m == 'showMovementlist') {
      return l == 'en' ? "Movement" : "รายการเคลื่อนไหวเงินกู้";
    }
    if (m == 'guaranteeAmount') {
      return l == 'en' ? "Guarantee amount" : "ยอดค้ำประกัน";
    }
    if (m == 'collateralForLoanAgreement') {
      return l == 'en'
          ? "Collateral for loan agreement"
          : "หลักประกันสัญญาเงินกู้";
    }
    if (m == 'date') {
      return l == 'en' ? "Date" : "วันที่ทำรายการ";
    }
    if (m == 'principal') {
      return l == 'en' ? "Principal" : "เงินต้น";
    }
    if (m == 'interest') {
      return l == 'en' ? "Interest" : "ดอกเบี้ย";
    }
  }

  static deposit(m, l) {
    if (m == 'member') {
      return l == 'en' ? "Membership" : "ทะเบียนสมาชิก";
    }
    if (m == 'name') {
      return l == 'en' ? "Name" : "ชื่อ - สกุล";
    }
    if (m == 'amount') {
      return l == 'en' ? "Amount" : "จำนวนเงิน";
    }
    if (m == 'detail') {
      return l == 'en' ? "Detail" : "รายละเอียด";
    }
    if (m == 'deposit') {
      return l == 'en' ? "Deposit" : "เงินฝาก";
    }
    if (m == 'date') {
      return l == 'en' ? "Date" : "วันที่ทำรายการ";
    }
    if (m == 'depositAccountDetails') {
      return l == 'en' ? "Deposit account details" : "รายละเอียดบัญชีเงินฝาก";
    }
    if (m == 'accountNumber') {
      return l == 'en' ? "Account Number" : "เลขที่บัญชี";
    }
    if (m == 'accountName') {
      return l == 'en' ? "Account Name" : "ชื่อบัญชี";
    }
    if (m == 'accountType') {
      return l == 'en' ? "Account Type" : "ประเภทบัญชี";
    }
    if (m == 'accountOpeningDate') {
      return l == 'en' ? "Account open date" : "วันที่เปิดบัญชี";
    }
    if (m == 'remainingAmount') {
      return l == 'en' ? "Remaining amount" : "จำนวนเงินคงเหลือ";
    }
    if (m == 'amountWithdrawn') {
      return l == 'en' ? "Amount withdrawn" : "จำนวนเงินที่ถอนได้";
    }
    if (m == 'accountMovements') {
      return l == 'en' ? "Account movements" : "รายการเคลื่อนไหวบัญชีเงินฝาก";
    }
    if (m == 'balance') {
      return l == 'en' ? "Balance" : "คงเหลือ";
    }
  }

  static guaranteeLg(m, l) {
    if (m == 'member') {
      return l == 'en' ? "Membership" : "ทะเบียนสมาชิก";
    }
    if (m == 'name') {
      return l == 'en' ? "Name" : "ชื่อ - สกุล";
    }
    if (m == 'guaranteeObligations') {
      return l == 'en' ? "Guarantee obligations" : "ภาระการค้ำประกัน";
    }
    if (m == 'guarantees') {
      return l == 'en' ? "Guarantees" : "การค้ำประกัน";
    }
    if (m == 'debt') {
      return l == 'en' ? "Debt" : "หนี้คงเหลือ";
    }
  }

  static dividendLg(m, l) {
    if (m == 'member') {
      return l == 'en' ? "Membership" : "ทะเบียนสมาชิก";
    }
    if (m == 'name') {
      return l == 'en' ? "Name" : "ชื่อ - สกุล";
    }
    if (m == 'dividend') {
      return l == 'en' ? "Dividend" : "ปันผล";
    }
    if (m == 'averageRefund') {
      return l == 'en' ? "Average refund" : "เฉลี่ยคืน";
    }
    if (m == 'dividendAverageRefund') {
      return l == 'en' ? "Dividend-Average refund" : "ปันผล-เฉลี่ยคืน";
    }
    if (m == 'fiscalYear') {
      return l == 'en' ? "Fiscal year" : "ปีบัญชี";
    }
    if (m == 'getMoney') {
      return l == 'en' ? "Get money" : "รับเงินสุทธิ";
    }
    if (m == 'detail') {
      return l == 'en' ? "Detail" : "รายละเอียด";
    }
    if (m == 'amount') {
      return l == 'en' ? "Amount" : "จำนวนเงิน";
    }
    if (m == 'dividendAverageDetail') {
      return l == 'en'
          ? "Dividend-Average Detail"
          : "รายละเอียด ปันผล-เฉลี่ยคืน";
    }
  }

  static gainLg(m, l) {
    if (m == 'member') {
      return l == 'en' ? "Membership" : "ทะเบียนสมาชิก";
    }
    if (m == 'name') {
      return l == 'en' ? "Name" : "ชื่อ - สกุล";
    }
    if (m == 'gain') {
      return l == 'en' ? "Beneficiary" : "ผู้รับผลประโยชน์";
    }
    if (m == 'idCard') {
      return l == 'en' ? "ID Card" : "บัตรประชาชน";
    }
    if (m == 'relatedNa') {
      return l == 'en' ? "ความสัมพันธ์" : "ความสัมพันธ์";
    }
  }

  static keptLg(m, l) {
    if (m == 'member') {
      return l == 'en' ? "Membership" : "ทะเบียนสมาชิก";
    }
    if (m == 'name') {
      return l == 'en' ? "Name" : "ชื่อ - สกุล";
    }
    if (m == 'kept') {
      return l == 'en' ? "Billed Monthly" : "เรียกเก็บเงินรายเดือน";
    }
    if (m == 'amount') {
      return l == 'en' ? "Amount" : "จำนวนเงิน";
    }
    if (m == 'detail') {
      return l == 'en' ? "Detail" : "รายละเอียด";
    }
    if (m == 'receiptNumber') {
      return l == 'en' ? "Receipt number" : "เลขที่ใบเสร็จ";
    }
    if (m == 'receiptDate') {
      return l == 'en' ? "Receipt Date" : "วันที่ใบเสร็จ";
    }
    if (m == 'billedCharge') {
      return l == 'en' ? "Billed Charge" : "ยอดเรียกเก็บ";
    }
    if (m == 'month') {
      return l == 'en' ? "Month" : "เดือน";
    }
    if (m == 'year') {
      return l == 'en' ? "Year" : "ปี";
    }
    if (m == 'printBilledMonthly') {
      return l == 'en'
          ? "Print Billed Monthly"
          : "พิมพ์รายการเรียกเก็บรายเดือน";
    }
    if (m == 'principal') {
      return l == 'en' ? "Principal" : "เงินต้น";
    }
    if (m == 'interest') {
      return l == 'en' ? "Interest" : "ดอกเบี้ย";
    }
  }

  static cremationLg(m, l) {
    if (m == 'member') {
      return l == 'en' ? "Membership" : "ทะเบียนสมาชิก";
    }
    if (m == 'name') {
      return l == 'en' ? "Name" : "ชื่อ";
    }
    if (m == 'cremation') {
      return l == 'en' ? "สมาคมฌาปนกิจ" : "สมาคมฌาปนกิจ";
    }
    if (m == 'idCard') {
      return l == 'en' ? "ID Card" : "บัตรประชาชน";
    }
    if (m == 'type') {
      return l == 'en' ? "ประเภทสมาคม" : "ประเภทสมาคม";
    }
  }

  static profileLg(m, l) {
    if (m == 'member') {
      return l == 'en' ? "Membership: " : "ทะเบียนสมาชิก: ";
    }
    if (m == 'idCard') {
      return l == 'en' ? "ID Card: " : "บัตรประชาชน: ";
    }
    if (m == 'birthday') {
      return l == 'en' ? "Birthday: " : "วันเกิด: ";
    }
    if (m == 'dateOfMembership') {
      return l == 'en' ? "Date of membership: " : "วันที่เป็นสมาชิก: ";
    }
    if (m == 'phone') {
      return l == 'en' ? "Phone: " : "เบอร์โทรศัพท์: ";
    }
    if (m == 'department') {
      return l == 'en' ? "Department: " : "หน่วยงาน: ";
    }
    if (m == 'address') {
      return l == 'en' ? "Address: " : "ที่อยู่: ";
    }
    if (m == 'profile') {
      return l == 'en' ? "Profile" : "ข้อมูลส่วนตัว";
    }
    if (m == 'camera') {
      return l == 'en' ? "Camera" : "กล้อง";
    }
    if (m == 'gallery') {
      return l == 'en' ? "Gallery" : "คลังภาพ";
    }
    if (m == 'cancel') {
      return l == 'en' ? "Cancel" : "ยกเลิก";
    }
    if (m == 'upload') {
      return l == 'en' ? "Upload" : "เปลี่ยน";
    }
  }

  static settingLg(m, l) {
    if (m == 'setting') {
      return l == 'en' ? "Setting" : "ตั้งค่า";
    }
    if (m == 'about') {
      return l == 'en' ? "About" : "เกี่ยวกับ";
    }
    if (m == 'passwordSecurity') {
      return l == 'en' ? "Password Security" : "ความปลอดภัยของรหัสผ่าน";
    }
    if (m == 'language') {
      return l == 'en' ? "Language" : "ภาษา";
    }
    if (m == 'about') {
      return l == 'en' ? "About" : "เกี่ยวกับ";
    }
    if (m == 'touchAndFace') {
      return l == 'en' ? "TouchID And FaceID" : "สแกนลายนิ้วมือและใบหน้า";
    }
    if (m == 'change') {
      return l == 'en' ? "Change" : "เปลี่ยนภาษา";
    }
    if (m == 'cancel') {
      return l == 'en' ? "Cancel" : "ยกเลิก";
    }
    if (m == 'logOut') {
      return l == 'en' ? "Log Out" : "ออกจากระบบ";
    }
    if (m == 'application') {
      return l == 'en' ? "Application" : "ข้อมูลแอปพลิเคชัน";
    }
    if (m == 'version') {
      return l == 'en' ? "Version" : "เวอร์ชัน";
    }
    if (m == 'mobile') {
      return l == 'en' ? "Mobile" : "ข้อมูลมือถือ";
    }
    if (m == 'platform') {
      return l == 'en' ? "Platform" : "ระบบปฏิบัติการ";
    }
    if (m == 'model') {
      return l == 'en' ? "Model" : "ประเภท";
    }

    if (m == 'changePin') {
      return l == 'en' ? "Change Pin" : "เปลี่ยน Pin";
    }
    if (m == 'forgotPassword') {
      return l == 'en' ? "Forgot password" : "ลืมรหัสผ่าน";
    }
    if (m == 'deactivate') {
      return l == 'en' ? "Deactivate" : "ลงชื่อออกจากระบบ";
    }

    if (m == 'changePinDetail') {
      return l == 'en'
          ? "\t\tTo change the PIN Code, you must first enter the old password. And then change to the new code you need"
          : "\t\tการเปลี่ยน PIN Code ท่านจะต้องใส่รหัสผ่านของเก่าก่อน แล้วก็เปลี่ยนเป็นรหัสใหม่ที่ท่านต้องการ";
    }
    if (m == 'forgotPasswordDetail') {
      return l == 'en'
          ? "\t\tMaking this menu, the system will delete all of your PIN Code. You must finish changing the password and then set the new PIN Code of access."
          : "\t\tการทำเมนูนี้ ระบบจะทำการลบ PIN Code ของท่านออกทั้งหมด ท่านต้องทำการ เปลี่ยนรหัสผ่านให้เสร็จแล้วมาตั้ง PIN Code ของการเข้าใช้งานใหม่";
    }
    if (m == 'deactivateDetail') {
      return l == 'en'
          ? "\t\tTermination menu The system will delete All of your Mobile App settings If you want to use the App, you must sign in again."
          : "\t\tเมนูการยกเลิกการใช้งาน ระบบจะทำการลบ ข้อมูลการตั้งค่าของ App Mobile ของท่านทั้งหมด ถ้าต้องการเข้าใช้งาน App ท่านจะต้องทำการลงชื่อเข้าใช้งานใหม่";
    }

    if (m == 'yes') {
      return l == 'en' ? "     Yes     " : "     ใช่     ";
    }
    if (m == 'no') {
      return l == 'en' ? "     No     " : "     ไม่     ";
    }
    if (m == 'youWant') {
      return l == 'en' ? "You want " : "ท่านต้องการ ";
    }
    if (m == 'yesOrNo') {
      return l == 'en' ? "Yes or No" : "ใช่ หรือ ไม่";
    }
    if (m == 'adjustFontSize') {
      return l == 'en' ? "Adjust font size" : "ขนาดตัวอักษร";
    }
    if (m == 'small') {
      return l == 'en' ? "Small" : "เล็ก";
    }
    if (m == 'normal') {
      return l == 'en' ? "Normal" : "ปกติ";
    }
    if (m == 'large') {
      return l == 'en' ? "Large" : "ใหญ่";
    }
    if (m == 'fontsize') {
      return l == 'en' ? "Font Size" : "ขนาดตัวอักษร";
    }
    if (m == 'select') {
      return l == 'en' ? "Select" : "เลือก";
    }
    if (m == 'save') {
      return l == 'en' ? "Save" : "บันทึก";
    }
    if (m == 'selectfont') {
      return l == 'en' ? "Please select a font size" : "กรุณาเลือกขนาดตัวอักษร";
    }
  }

  static pinLg(m, l) {
    if (m == 'pinCode') {
      return l == 'en' ? "Please enter the PIN Code" : "กรุณาใส่ PIN Code";
    }
    if (m == 'pleaseTryAgain') {
      return l == 'en'
          ? "Wrong password, please try again"
          : "รหัสผ่านผิดโปรดลองอีกครั้ง";
    }
    if (m == 'originalPINCode') {
      return l == 'en'
          ? "Please enter the original PIN Code"
          : "กรุณาใส่ PIN Code เดิม";
    }
    if (m == 'incorrectOriginalPINCode') {
      return l == 'en'
          ? "The original PIN Code is incorrect"
          : "PIN Code เดิม ไม่ถูกต้อง";
    }
    if (m == 'setPassword') {
      return l == 'en' ? "Set password" : "ตั้งรหัสผ่าน";
    }
    if (m == 'confirmPassword') {
      return l == 'en' ? "Confirm password" : "ยืนยันรหัสผ่าน";
    }
    if (m == 'confirmPleaseTryAgain') {
      return l == 'en'
          ? "Wrong password confirmation. Please try again"
          : "ยืนยันรหัสผ่านผิดโปรดลองอีกครั้ง";
    }
    if (m == 'confirmTouchIDAndFaceID') {
      return l == 'en'
          ? "Confirm activation of TouchID and FaceID"
          : "ยืนยันการเปิดใช้งาน TouchID และ FaceID";
    }
    if (m == 'incorrectconfirmTouchIDAndFaceID') {
      return l == 'en'
          ? "The password was wrong. Please try again"
          : "รหัสผ่านเปิดใช้งานผิดโปรดลองอีกครั้ง";
    }
    if (m == 'delete') {
      return l == 'en' ? "Delete" : "ลบ";
    }
    if (m == 'reset') {
      return l == 'en' ? "Reset" : "รีเซ็ต";
    }
    if (m == 'forgot') {
      return l == 'en' ? "Forgot" : "ลืม Pin";
    }
    if (m == 'update') {
      return l == 'en' ? "update" : "อัพเดท";
    }
    if (m == 'yes') {
      return l == 'en' ? "Yes" : "ใช่";
    }
    if (m == 'no') {
      return l == 'en' ? "No" : "ไม่";
    }
    if (m == 'fversion') {
      return l == 'en'
          ? "The application does not support."
          : "แอปพลิเคชัน ไม่สนับสนุน";
    }
    if (m == 'uversion') {
      return l == 'en' ? "Version Update" : "เวอร์ชั่นอัพเดท";
    }
    if (m == 'changedpassword') {
      return l == 'en'
          ? "The password has been changed."
          : "รหัสผ่านมีการเปลี่ยนแปลง";
    }
    if (m == 'changedpasswordlogin') {
      return l == 'en'
          ? "Your password has been changed. You must log in again."
          : "รหัสผ่านของท่านมีการเปลี่ยนแปลงท่านต้องลงชื่อเข้าสู่ระบบใหม่";
    }
    if (m == 'ok') {
      return l == 'en' ? "OK" : "ตกลง";
    }
  }

  static loginLg(m, l) {
    if (m == 'member') {
      return l == 'en' ? "Membership" : "ทะเบียนสมาชิก";
    }
    if (m == 'memberDetail') {
      return l == 'en'
          ? "Please enter your ${MyClass.lengthmember()}-digit membership registration number"
          : "กรุณาใส่เลขทะเบียนสมาชิก ให้ครบ ${MyClass.lengthmember()} หลัก";
    }
    if (m == 'password') {
      return l == 'en' ? "Password" : "รหัสผ่าน";
    }
    if (m == 'confirmPassword') {
      return l == 'en' ? "Confirm password" : "ยืนยันรหัสผ่าน";
    }
    if (m == 'pleaseConfirmPassword') {
      return l == 'en' ? "Please confirm password" : "กรุณายืนยันรหัสผ่าน";
    }
    if (m == 'pleaseYourpassword') {
      return l == 'en' ? "Please enter your password" : "กรุณาใส่รหัสผ่าน";
    }
    if (m == 'logIn') {
      return l == 'en' ? "Log In" : "เข้าสู่ระบบ";
    }
    if (m == 'memberRegis') {
      return l == 'en' ? "Member registration" : "สมัครสมาชิก";
    }
    if (m == 'forgotPassword') {
      return l == 'en' ? "Forgot password" : "ลืมรหัสผ่าน";
    }
    if (m == 'alertlogin') {
      return l == 'en'
          ? "Please check your member registration number and password or the internet"
          : "กรุณาตรวจสอบหมายเลขสมาชิกและรหัสผ่านหรืออินเทอร์เน็ต";
    }
    // checkregis
    if (m == 'checkMemberRegistration') {
      return l == 'en'
          ? "Please check the member registration number"
          : "กรุณาตรวจสอบเลขทะเบียนสมาชิก";
    }
    if (m == 'checkInformation') {
      return l == 'en' ? "Check information" : "ตรวจสอบข้อมูล";
    }
    if (m == 'cancel') {
      return l == 'en' ? "   Cancel   " : "   ยกเลิก   ";
    }
    // regis and forget
    if (m == 'idCardDetail') {
      return l == 'en'
          ? "Please enter your 13-digit identification number"
          : "กรุณาใส่เลขบัตรประชาชน ให้ครบ 13 หลัก";
    }
    if (m == 'birthDayDetail') {
      return l == 'en'
          ? "Please specify the date of birth in the form 01/01/2563 \n or click the Icon"
          : "กรุณาระบุวันเกิดในรูปแบบ  01/01/2563 หรือ คลิกที่รูป Icon";
    }
    if (m == 'passwordDetail') {
      return l == 'en'
          ? "Please enter a password, at least 6 digits"
          : "กรุณาใส่รหัสผ่านอย่างน้อย 6 หลัก";
    }
    if (m == 'invalidIDCard') {
      return l == 'en'
          ? "Invalid ID card number"
          : "หมายเลขบัตรประชาชนไม่ถูกต้อง";
    }

    if (m == 'invalidConPassword') {
      return l == 'en' ? "Invalid confirmation code" : "รหัสยืนยันไม่ถูกต้อง";
    }
    if (m == 'invalidBirthday') {
      return l == 'en' ? "Invalid birthday" : "วันเกิดไม่ถูกต้อง";
    }
    if (m == 'registrationFailed') {
      return l == 'en' ? "Registration failed" : "ลงทะเบียนไม่สำเร็จ";
    }
    if (m == 'passwordChangeUnsuccessful') {
      return l == 'en'
          ? "Password change unsuccessful"
          : "เปลี่ยนรหัสผ่านไม่สำเร็จ";
    }
    if (m == 'save') {
      return l == 'en' ? "   Save   " : "   บันทึก   ";
    }
    if (m == 'idCard') {
      return l == 'en' ? "ID Card" : "บัตรประชาชน";
    }
    if (m == 'birthday') {
      return l == 'en' ? "Birthday" : "วันเกิด";
    }
  }

  static tabsLg(m, l) {
    if (m == 'menu') {
      return l == 'en' ? "Menu" : "เมนู";
    }
    if (m == 'address') {
      return l == 'en' ? "Address" : "ที่อยู่สหกรณ์";
    }
    if (m == 'profile') {
      return l == 'en' ? "Profile" : "ข้อมูลส่วนตัว";
    }
    if (m == 'news') {
      return l == 'en' ? "News" : "ข่าวสาร";
    }
  }

  static newsLg(m, l) {
    if (m == 'news') {
      return l == 'en' ? "News" : "ข่าวสาร";
    }
    if (m == 'Coopnews') {
      return l == 'en' ? "Cooperative news" : "ข่าวประชาสัมพันธ์";
    }
    if (m == 'load') {
      return l == 'en' ? "Load" : "โหลดไฟล์";
    }
  }

  static addressLg(m, l) {
    if (m == 'address') {
      return l == 'en' ? "Address" : "ที่อยู่สหกรณ์";
    }
  }

  static mainLg(m, l) {
    if (m == 'nodata') {
      return l == 'en' ? "No item" : "ไม่มีรายการ";
    }
  }
}
