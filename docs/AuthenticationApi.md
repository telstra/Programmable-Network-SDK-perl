# TelstraTPN::AuthenticationApi

## Load the API package
```perl
use TelstraTPN::Object::AuthenticationApi;
```

All URIs are relative to *https://penapi.pacnetconnect.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**auth_generatetoken_post**](AuthenticationApi.md#auth_generatetoken_post) | **POST** /1.0.0/auth/generatetoken | Create an authentication token
[**auth_validatetoken_get**](AuthenticationApi.md#auth_validatetoken_get) | **GET** /1.0.0/auth/validatetoken | Validate authentication token


# **auth_generatetoken_post**
> AuthGeneratetokenResponse auth_generatetoken_post(grant_type => $grant_type, username => $username, password => $password)

Create an authentication token

Create an authentication token

### Example 
```perl
use Data::Dumper;
use TelstraTPN::AuthenticationApi;
my $api_instance = TelstraTPN::AuthenticationApi->new(
);

my $grant_type = 'grant_type_example'; # string | 
my $username = 'username_example'; # string | 
my $password = 'password_example'; # string | 

eval { 
    my $result = $api_instance->auth_generatetoken_post(grant_type => $grant_type, username => $username, password => $password);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling AuthenticationApi->auth_generatetoken_post: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **grant_type** | **string**|  | 
 **username** | **string**|  | 
 **password** | **string**|  | 

### Return type

[**AuthGeneratetokenResponse**](AuthGeneratetokenResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/x-www-form-urlencoded
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **auth_validatetoken_get**
> AuthValidatetokenResponse auth_validatetoken_get()

Validate authentication token

Validate the authentication token and get information about the user (roles, permissions, etc.)

### Example 
```perl
use Data::Dumper;
use TelstraTPN::AuthenticationApi;
my $api_instance = TelstraTPN::AuthenticationApi->new(
);


eval { 
    my $result = $api_instance->auth_validatetoken_get();
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling AuthenticationApi->auth_validatetoken_get: $@\n";
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**AuthValidatetokenResponse**](AuthValidatetokenResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

