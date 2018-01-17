# TelstraTPN::DatacentresApi

## Load the API package
```perl
use TelstraTPN::Object::DatacentresApi;
```

All URIs are relative to *https://penapi.pacnetconnect.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**inventory_datacenters_get**](DatacentresApi.md#inventory_datacenters_get) | **GET** /1.0.0/inventory/datacenters | Get list of all the data centers


# **inventory_datacenters_get**
> ARRAY[InventoryDatacentersResponse] inventory_datacenters_get()

Get list of all the data centers

Get list of all the data centers

### Example 
```perl
use Data::Dumper;
use TelstraTPN::DatacentresApi;
my $api_instance = TelstraTPN::DatacentresApi->new(

    # Configure OAuth2 access token for authorization: auth
    access_token => 'YOUR_ACCESS_TOKEN',
);


eval { 
    my $result = $api_instance->inventory_datacenters_get();
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling DatacentresApi->inventory_datacenters_get: $@\n";
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**ARRAY[InventoryDatacentersResponse]**](InventoryDatacentersResponse.md)

### Authorization

[auth](../README.md#auth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

