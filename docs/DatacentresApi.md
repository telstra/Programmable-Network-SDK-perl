# TelstraTPN::DatacentresApi

## Load the API package
```perl
use TelstraTPN::Object::DatacentresApi;
```

All URIs are relative to *https://penapi.pacnetconnect.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**100_inventory_datacenters_get**](DatacentresApi.md#100_inventory_datacenters_get) | **GET** /1.0.0/inventory/datacenters | Get list of all the data centers


# **100_inventory_datacenters_get**
> ARRAY[Model100InventoryDatacentersResponse] 100_inventory_datacenters_get()

Get list of all the data centers

Get list of all the data centers

### Example 
```perl
use Data::Dumper;
use TelstraTPN::Configuration;
use TelstraTPN::DatacentresApi;

my $api_instance = TelstraTPN::DatacentresApi->new();

eval { 
    my $result = $api_instance->100_inventory_datacenters_get();
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling DatacentresApi->100_inventory_datacenters_get: $@\n";
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**ARRAY[Model100InventoryDatacentersResponse]**](Model100InventoryDatacentersResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

