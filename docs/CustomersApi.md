# TelstraTPN::CustomersApi

## Load the API package
```perl
use TelstraTPN::Object::CustomersApi;
```

All URIs are relative to *https://penapi.pacnetconnect.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**100_account_by_customeruuid_get**](CustomersApi.md#100_account_by_customeruuid_get) | **GET** /1.0.0/account/{customeruuid} | Get account information details
[**100_account_user_by_customeruuid_get**](CustomersApi.md#100_account_user_by_customeruuid_get) | **GET** /1.0.0/account/{customeruuid}/user | List users


# **100_account_by_customeruuid_get**
> Model100AccountResponse 100_account_by_customeruuid_get(customeruuid => $customeruuid)

Get account information details

Get the account information for the specified customer

### Example 
```perl
use Data::Dumper;
use TelstraTPN::Configuration;
use TelstraTPN::CustomersApi;

my $api_instance = TelstraTPN::CustomersApi->new();
my $customeruuid = 'customeruuid_example'; # string | Unique identifier representing a specific customer

eval { 
    my $result = $api_instance->100_account_by_customeruuid_get(customeruuid => $customeruuid);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling CustomersApi->100_account_by_customeruuid_get: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **customeruuid** | **string**| Unique identifier representing a specific customer | 

### Return type

[**Model100AccountResponse**](Model100AccountResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **100_account_user_by_customeruuid_get**
> ARRAY[User] 100_account_user_by_customeruuid_get(customeruuid => $customeruuid)

List users

List all users associated with the specified customer

### Example 
```perl
use Data::Dumper;
use TelstraTPN::Configuration;
use TelstraTPN::CustomersApi;

my $api_instance = TelstraTPN::CustomersApi->new();
my $customeruuid = 'customeruuid_example'; # string | Unique identifier representing a specific customer

eval { 
    my $result = $api_instance->100_account_user_by_customeruuid_get(customeruuid => $customeruuid);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling CustomersApi->100_account_user_by_customeruuid_get: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **customeruuid** | **string**| Unique identifier representing a specific customer | 

### Return type

[**ARRAY[User]**](User.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

