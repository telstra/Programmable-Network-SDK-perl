# TelstraTPN::VportsApi

## Load the API package
```perl
use TelstraTPN::Object::VportsApi;
```

All URIs are relative to *https://penapi.pacnetconnect.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**inventory_regularvport_post**](VportsApi.md#inventory_regularvport_post) | **POST** /1.0.0/inventory/regularvport | Create VPort for physical endpoint
[**inventory_vnf_vport_post**](VportsApi.md#inventory_vnf_vport_post) | **POST** /1.0.0/inventory/vnf/vport | Create VNF VPort
[**inventory_vport_by_vportuuid_get**](VportsApi.md#inventory_vport_by_vportuuid_get) | **GET** /1.0.0/inventory/vport/{vportuuid} | Get information about the specified VPort


# **inventory_regularvport_post**
> InventoryRegularvportResponse inventory_regularvport_post(body => $body)

Create VPort for physical endpoint

Create VPort representing a VLAN on a Physical Ethernet Port

### Example 
```perl
use Data::Dumper;
use TelstraTPN::VportsApi;
my $api_instance = TelstraTPN::VportsApi->new(

    # Configure OAuth2 access token for authorization: auth
    access_token => 'YOUR_ACCESS_TOKEN',
);

my $body = TelstraTPN::Object::InventoryRegularvportRequest->new(); # InventoryRegularvportRequest | 

eval { 
    my $result = $api_instance->inventory_regularvport_post(body => $body);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling VportsApi->inventory_regularvport_post: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**InventoryRegularvportRequest**](InventoryRegularvportRequest.md)|  | [optional] 

### Return type

[**InventoryRegularvportResponse**](InventoryRegularvportResponse.md)

### Authorization

[auth](../README.md#auth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **inventory_vnf_vport_post**
> InventoryVnfVportResponse inventory_vnf_vport_post(body => $body)

Create VNF VPort

Create VNF VPort

### Example 
```perl
use Data::Dumper;
use TelstraTPN::VportsApi;
my $api_instance = TelstraTPN::VportsApi->new(

    # Configure OAuth2 access token for authorization: auth
    access_token => 'YOUR_ACCESS_TOKEN',
);

my $body = TelstraTPN::Object::InventoryVnfVportRequest->new(); # InventoryVnfVportRequest | 

eval { 
    my $result = $api_instance->inventory_vnf_vport_post(body => $body);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling VportsApi->inventory_vnf_vport_post: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**InventoryVnfVportRequest**](InventoryVnfVportRequest.md)|  | [optional] 

### Return type

[**InventoryVnfVportResponse**](InventoryVnfVportResponse.md)

### Authorization

[auth](../README.md#auth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **inventory_vport_by_vportuuid_get**
> ARRAY[EndpointPort] inventory_vport_by_vportuuid_get(vportuuid => $vportuuid)

Get information about the specified VPort

Get information about the specified VPort

### Example 
```perl
use Data::Dumper;
use TelstraTPN::VportsApi;
my $api_instance = TelstraTPN::VportsApi->new(

    # Configure OAuth2 access token for authorization: auth
    access_token => 'YOUR_ACCESS_TOKEN',
);

my $vportuuid = 'vportuuid_example'; # string | Unique identifier representing a specific virtual port

eval { 
    my $result = $api_instance->inventory_vport_by_vportuuid_get(vportuuid => $vportuuid);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling VportsApi->inventory_vport_by_vportuuid_get: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **vportuuid** | **string**| Unique identifier representing a specific virtual port | 

### Return type

[**ARRAY[EndpointPort]**](EndpointPort.md)

### Authorization

[auth](../README.md#auth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

