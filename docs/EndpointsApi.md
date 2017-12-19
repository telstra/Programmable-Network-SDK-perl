# TelstraTPN::EndpointsApi

## Load the API package
```perl
use TelstraTPN::Object::EndpointsApi;
```

All URIs are relative to *https://penapi.pacnetconnect.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**100_inventory_endpoint_by_endpointuuid_get**](EndpointsApi.md#100_inventory_endpoint_by_endpointuuid_get) | **GET** /1.0.0/inventory/endpoint/{endpointuuid} | Get information about the specified endpoint
[**100_inventory_endpoints_customeruuid_by_customeruuid_get**](EndpointsApi.md#100_inventory_endpoints_customeruuid_by_customeruuid_get) | **GET** /1.0.0/inventory/endpoints/customeruuid/{customeruuid} | Get list of endpoints for a customer
[**100_inventory_regularendpoint_post**](EndpointsApi.md#100_inventory_regularendpoint_post) | **POST** /1.0.0/inventory/regularendpoint | Create Physical (Port) Endpoint
[**100_inventory_vnfendpoint_post**](EndpointsApi.md#100_inventory_vnfendpoint_post) | **POST** /1.0.0/inventory/vnfendpoint | Create VNF Endpoint
[**eis100_endpoints_assign_topology_tag_by_endpointuuid_post**](EndpointsApi.md#eis100_endpoints_assign_topology_tag_by_endpointuuid_post) | **POST** /eis/1.0.0/endpoints/{endpointuuid}/assign_topology_tag | Assign a Topology Tag to an Endpoint


# **100_inventory_endpoint_by_endpointuuid_get**
> Model100InventoryEndpointResponse 100_inventory_endpoint_by_endpointuuid_get(endpointuuid => $endpointuuid)

Get information about the specified endpoint

Get information about the specified endpoint

### Example 
```perl
use Data::Dumper;
use TelstraTPN::Configuration;
use TelstraTPN::EndpointsApi;

my $api_instance = TelstraTPN::EndpointsApi->new();
my $endpointuuid = 'endpointuuid_example'; # string | Unique identifier representing a specific endpoint

eval { 
    my $result = $api_instance->100_inventory_endpoint_by_endpointuuid_get(endpointuuid => $endpointuuid);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling EndpointsApi->100_inventory_endpoint_by_endpointuuid_get: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **endpointuuid** | **string**| Unique identifier representing a specific endpoint | 

### Return type

[**Model100InventoryEndpointResponse**](Model100InventoryEndpointResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **100_inventory_endpoints_customeruuid_by_customeruuid_get**
> Model100InventoryEndpointsCustomeruuidResponse 100_inventory_endpoints_customeruuid_by_customeruuid_get(customeruuid => $customeruuid)

Get list of endpoints for a customer

Get list of endpoints for a customer

### Example 
```perl
use Data::Dumper;
use TelstraTPN::Configuration;
use TelstraTPN::EndpointsApi;

my $api_instance = TelstraTPN::EndpointsApi->new();
my $customeruuid = 'customeruuid_example'; # string | Unique identifier representing a specific customer

eval { 
    my $result = $api_instance->100_inventory_endpoints_customeruuid_by_customeruuid_get(customeruuid => $customeruuid);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling EndpointsApi->100_inventory_endpoints_customeruuid_by_customeruuid_get: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **customeruuid** | **string**| Unique identifier representing a specific customer | 

### Return type

[**Model100InventoryEndpointsCustomeruuidResponse**](Model100InventoryEndpointsCustomeruuidResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **100_inventory_regularendpoint_post**
> Model100InventoryRegularendpointResponse 100_inventory_regularendpoint_post(body => $body)

Create Physical (Port) Endpoint

Create Physical (Port) Endpoint

### Example 
```perl
use Data::Dumper;
use TelstraTPN::Configuration;
use TelstraTPN::EndpointsApi;

my $api_instance = TelstraTPN::EndpointsApi->new();
my $body = TelstraTPN::Object::Model100InventoryRegularendpointRequest->new(); # Model100InventoryRegularendpointRequest | 

eval { 
    my $result = $api_instance->100_inventory_regularendpoint_post(body => $body);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling EndpointsApi->100_inventory_regularendpoint_post: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**Model100InventoryRegularendpointRequest**](Model100InventoryRegularendpointRequest.md)|  | [optional] 

### Return type

[**Model100InventoryRegularendpointResponse**](Model100InventoryRegularendpointResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **100_inventory_vnfendpoint_post**
> Model100InventoryVnfendpointResponse 100_inventory_vnfendpoint_post(body => $body)

Create VNF Endpoint

Create VNF Endpoint

### Example 
```perl
use Data::Dumper;
use TelstraTPN::Configuration;
use TelstraTPN::EndpointsApi;

my $api_instance = TelstraTPN::EndpointsApi->new();
my $body = TelstraTPN::Object::Model100InventoryVnfendpointRequest->new(); # Model100InventoryVnfendpointRequest | 

eval { 
    my $result = $api_instance->100_inventory_vnfendpoint_post(body => $body);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling EndpointsApi->100_inventory_vnfendpoint_post: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**Model100InventoryVnfendpointRequest**](Model100InventoryVnfendpointRequest.md)|  | [optional] 

### Return type

[**Model100InventoryVnfendpointResponse**](Model100InventoryVnfendpointResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **eis100_endpoints_assign_topology_tag_by_endpointuuid_post**
> SuccessFragment eis100_endpoints_assign_topology_tag_by_endpointuuid_post(endpointuuid => $endpointuuid, body => $body)

Assign a Topology Tag to an Endpoint

Assign a Topology Tag to an Endpoint

### Example 
```perl
use Data::Dumper;
use TelstraTPN::Configuration;
use TelstraTPN::EndpointsApi;

my $api_instance = TelstraTPN::EndpointsApi->new();
my $endpointuuid = 'endpointuuid_example'; # string | Unique identifier representing a specific endpoint
my $body = TelstraTPN::Object::Eis100EndpointsAssignTopologyTagRequest->new(); # Eis100EndpointsAssignTopologyTagRequest | 

eval { 
    my $result = $api_instance->eis100_endpoints_assign_topology_tag_by_endpointuuid_post(endpointuuid => $endpointuuid, body => $body);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling EndpointsApi->eis100_endpoints_assign_topology_tag_by_endpointuuid_post: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **endpointuuid** | **string**| Unique identifier representing a specific endpoint | 
 **body** | [**Eis100EndpointsAssignTopologyTagRequest**](Eis100EndpointsAssignTopologyTagRequest.md)|  | [optional] 

### Return type

[**SuccessFragment**](SuccessFragment.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

