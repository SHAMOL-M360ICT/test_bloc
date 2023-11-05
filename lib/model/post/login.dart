import 'dart:convert';

LoginSuccessModel loginSuccessFromJson(String str) => LoginSuccessModel.fromJson(json.decode(str));

String loginSuccessToJson(LoginSuccessModel data) => json.encode(data.toJson());

class LoginSuccessModel {
    bool? success;
    String? message;
    Data? data;
    String? token;
    String? title;

    LoginSuccessModel({
        this.success,
        this.message,
        this.data,
        this.token,
        this.title
    });

    factory LoginSuccessModel.fromJson(Map<String, dynamic> json) => LoginSuccessModel(
        success: json["success"],
        message: json["message"],
        data: json["data"] != null ? Data.fromJson(json["data"]) : null,
        token: json["token"],
        title: json["title"],
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data != null ? data!.toJson() : null,
        "token": token,
        "title": title,
    };
}

class Data {
    int id;
    String name;
    String email;
    String mobileNumber;
    bool mobileNumberVerification;
    bool emailVerification;
    String companyName;
    String status;
    int applicationId;
    String applicationStatus;
    int lastFilledPart;
    dynamic companyId;
    dynamic membershipExpiryDate;

    Data({
        required this.id,
        required this.name,
        required this.email,
        required this.mobileNumber,
        required this.mobileNumberVerification,
        required this.emailVerification,
        required this.companyName,
        required this.status,
        required this.applicationId,
        required this.applicationStatus,
        required this.lastFilledPart,
        required this.companyId,
        required this.membershipExpiryDate,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        mobileNumber: json["mobileNumber"],
        mobileNumberVerification: json["mobileNumberVerification"],
        emailVerification: json["emailVerification"],
        companyName: json["companyName"],
        status: json["status"],
        applicationId: json["applicationId"],
        applicationStatus: json["applicationStatus"],
        lastFilledPart: json["lastFilledPart"],
        companyId: json["companyId"],
        membershipExpiryDate: json["membershipExpiryDate"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "mobileNumber": mobileNumber,
        "mobileNumberVerification": mobileNumberVerification,
        "emailVerification": emailVerification,
        "companyName": companyName,
        "status": status,
        "applicationId": applicationId,
        "applicationStatus": applicationStatus,
        "lastFilledPart": lastFilledPart,
        "companyId": companyId,
        "membershipExpiryDate": membershipExpiryDate,
    };
}
