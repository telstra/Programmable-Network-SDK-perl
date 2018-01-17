# TelstraTPN::EndpointsApi

## Load the API package
```perl
use TelstraTPN::Object::EndpointsApi;
```

All URIs are relative to *https://penapi.pacnetconnect.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**eis100_endpoints_assign_topology_tag_by_endpointuuid_post**](EndpointsApi.md#eis100_endpoints_assign_topology_tag_by_endpointuuid_post) | **POST** /eis/1.0.0/endpoints/{endpointuuid}/assign_topology_tag | Assign a Topology Tag to an Endpoint
[**inventory_endpoint_by_endpointuuid_get**](EndpointsApi.md#inventory_endpoint_by_endpointuuid_get) | **GET** /1.0.0/inventory/endpoint/{endpointuuid} | Get information about the specified endpoint
[**inventory_endpoints_customeruuid_by_customeruuid_get**](EndpointsApi.md#inventory_endpoints_customeruuid_by_customeruuid_get) | **GET** /1.0.0/inventory/endpoints/customeruuid/{customeruuid} | Get list of endpoints for a customer
[**inventory_regularendpoint_post**](EndpointsApi.md#inventory_regularendpoint_post) | **POST** /1.0.0/inventory/regularendpoint | Create Physical (Port) Endpoint
[**inventory_vnfendpoint_post**](EndpointsApi.md#inventory_vnfendpoint_post) | **POST** /1.0.0/inventory/vnfendpoint | Create VNF Endpoint


# **eis100_endpoints_assign_topology_tag_by_endpointuuid_post**
> ARRAY[SuccessFragment] eis100_endpoints_assign_topology_tag_by_endpointuuid_post(endpointuuid => $endpointuuid, body => $body)

Assign a Topology Tag to an Endpoint

Assign a Topology Tag to an Endpoint

### Example 
```perl
use Data::Dumper;
use TelstraTPN::EndpointsApi;
my $api_instance = TelstraTPN::EndpointsApi->new(

    # Configure OAuth2 access token for authorization: auth
    access_token => 'YOUR_ACCESS_TOKEN',
);

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

[**ARRAY[SuccessFragment]**](SuccessFragment.md)

### Authorization

[auth](../README.md#auth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **inventory_endpoint_by_endpointuuid_get**
> InventoryEndpointResponse inventory_endpoint_by_endpointuuid_get(endpointuuid => $endpointuuid)

Get information about the specified endpoint

Get information about the specified endpoint

### Example 
```perl
use Data::Dumper;
use TelstraTPN::EndpointsApi;
my $api_instance = TelstraTPN::EndpointsApi->new(

    # Configure OAuth2 access token for authorization: auth
    access_token => 'YOUR_ACCESS_TOKEN',
);

my $endpointuuid = 'endpointuuid_example'; # string | Unique identifier representing a specific endpoint

eval { 
    my $result = $api_instance->inventory_endpoint_by_endpointuuid_get(endpointuuid => $endpointuuid);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling EndpointsApi->inventory_endpoint_by_endpointuuid_get: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **endpointuuid** | **string**| Unique identifier representing a specific endpoint | 

### Return type

[**InventoryEndpointResponse**](InventoryEndpointResponse.md)

### Authorization

[auth](../README.md#auth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **inventory_endpoints_customeruuid_by_customeruuid_get**
> InventoryEndpointsCustomeruuidResponse inventory_endpoints_customeruuid_by_customeruuid_get(customeruuid => $customeruuid)

Get list of endpoints for a customer

Get list of endpoints for a customer

### Example 
```perl
use Data::Dumper;
use TelstraTPN::EndpointsApi;
my $api_instance = TelstraTPN::EndpointsApi->new(

    # Configure OAuth2 access token for authorization: auth
    access_token => 'YOUR_ACCESS_TOKEN',
);

my $customeruuid = 'customeruuid_example'; # string | Unique identifier representing a specific customer

eval { 
    my $result = $api_instance->inventory_endpoints_customeruuid_by_customeruuid_get(customeruuid => $customeruuid);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling EndpointsApi->inventory_endpoints_customeruuid_by_customeruuid_get: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **customeruuid** | **string**| Unique identifier representing a specific customer | 

### Return type

[**InventoryEndpointsCustomeruuidResponse**](InventoryEndpointsCustomeruuidResponse.md)

### Authorization

[auth](../README.md#auth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **inventory_regularendpoint_post**
> ARRAY[InventoryRegularendpointResponse] inventory_regularendpoint_post(body => $body)

Create Physical (Port) Endpoint

Create Physical (Port) Endpoint

### Example 
```perl
use Data::Dumper;
use TelstraTPN::EndpointsApi;
my $api_instance = TelstraTPN::EndpointsApi->new(

    # Configure OAuth2 access token for authorization: auth
    access_token => 'YOUR_ACCESS_TOKEN',
);

my $body = TelstraTPN::Object::InventoryRegularendpointRequest->new(); # InventoryRegularendpointRequest | 

eval { 
    my $result = $api_instance->inventory_regularendpoint_post(body => $body);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling EndpointsApi->inventory_regularendpoint_post: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**InventoryRegularendpointRequest**](InventoryRegularendpointRequest.md)|  | [optional] 

### Return type

[**ARRAY[InventoryRegularendpointResponse]**](InventoryRegularendpointResponse.md)

### Authorization

[auth](../README.md#auth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **inventory_vnfendpoint_post**
> ARRAY[InventoryVnfendpointResponse] inventory_vnfendpoint_post(body => $body)

Create VNF Endpoint

Create VNF Endpoint

### Example 
```perl
use Data::Dumper;
use TelstraTPN::EndpointsApi;
my $api_instance = TelstraTPN::EndpointsApi->new(

    # Configure OAuth2 access token for authorization: auth
    access_token => 'YOUR_ACCESS_TOKEN',
);

my $body = TelstraTPN::Object::InventoryVnfendpointRequest->new(); # InventoryVnfendpointRequest | 

eval { 
    my $result = $api_instance->inventory_vnfendpoint_post(body => $body);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling EndpointsApi->inventory_vnfendpoint_post: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**InventoryVnfendpointRequest**](InventoryVnfendpointRequest.md)|  | [optional] 

### Return type

[**ARRAY[InventoryVnfendpointResponse]**](InventoryVnfendpointResponse.md)

### Authorization

[auth](../README.md#auth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

