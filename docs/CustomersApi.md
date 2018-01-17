# TelstraTPN::CustomersApi

## Load the API package
```perl
use TelstraTPN::Object::CustomersApi;
```

All URIs are relative to *https://penapi.pacnetconnect.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**account_by_customeruuid_get**](CustomersApi.md#account_by_customeruuid_get) | **GET** /1.0.0/account/{customeruuid} | Get account information details
[**account_user_by_customeruuid_get**](CustomersApi.md#account_user_by_customeruuid_get) | **GET** /1.0.0/account/{customeruuid}/user | List users


# **account_by_customeruuid_get**
> ARRAY[AccountResponse] account_by_customeruuid_get(customeruuid => $customeruuid)

Get account information details

Get the account information for the specified customer

### Example 
```perl
use Data::Dumper;
use TelstraTPN::CustomersApi;
my $api_instance = TelstraTPN::CustomersApi->new(

    # Configure OAuth2 access token for authorization: auth
    access_token => 'YOUR_ACCESS_TOKEN',
);

my $customeruuid = 'customeruuid_example'; # string | Unique identifier representing a specific customer

eval { 
    my $result = $api_instance->account_by_customeruuid_get(customeruuid => $customeruuid);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling CustomersApi->account_by_customeruuid_get: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **customeruuid** | **string**| Unique identifier representing a specific customer | 

### Return type

[**ARRAY[AccountResponse]**](AccountResponse.md)

### Authorization

[auth](../README.md#auth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **account_user_by_customeruuid_get**
> ARRAY[User] account_user_by_customeruuid_get(customeruuid => $customeruuid)

List users

List all users associated with the specified customer

### Example 
```perl
use Data::Dumper;
use TelstraTPN::CustomersApi;
my $api_instance = TelstraTPN::CustomersApi->new(

    # Configure OAuth2 access token for authorization: auth
    access_token => 'YOUR_ACCESS_TOKEN',
);

my $customeruuid = 'customeruuid_example'; # string | Unique identifier representing a specific customer

eval { 
    my $result = $api_instance->account_user_by_customeruuid_get(customeruuid => $customeruuid);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling CustomersApi->account_user_by_customeruuid_get: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **customeruuid** | **string**| Unique identifier representing a specific customer | 

### Return type

[**ARRAY[User]**](User.md)

### Authorization

[auth](../README.md#auth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

