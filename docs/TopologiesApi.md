# TelstraTPN::TopologiesApi

## Load the API package
```perl
use TelstraTPN::Object::TopologiesApi;
```

All URIs are relative to *https://penapi.pacnetconnect.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**ttms100_topology_tag_by_topotaguuid_delete**](TopologiesApi.md#ttms100_topology_tag_by_topotaguuid_delete) | **DELETE** /ttms/1.0.0/topology_tag/{topotaguuid}/ | Delete a topology tag
[**ttms100_topology_tag_by_topotaguuid_get**](TopologiesApi.md#ttms100_topology_tag_by_topotaguuid_get) | **GET** /ttms/1.0.0/topology_tag/{topotaguuid}/ | Get information about the specified topology tag
[**ttms100_topology_tag_by_topotaguuid_put**](TopologiesApi.md#ttms100_topology_tag_by_topotaguuid_put) | **PUT** /ttms/1.0.0/topology_tag/{topotaguuid}/ | Update a topology tag&#39;s name and/or description
[**ttms100_topology_tag_get**](TopologiesApi.md#ttms100_topology_tag_get) | **GET** /ttms/1.0.0/topology_tag | List all topology tags
[**ttms100_topology_tag_objects_by_topotaguuid_get**](TopologiesApi.md#ttms100_topology_tag_objects_by_topotaguuid_get) | **GET** /ttms/1.0.0/topology_tag/{topotaguuid}/objects/ | List objects for Topology
[**ttms100_topology_tag_post**](TopologiesApi.md#ttms100_topology_tag_post) | **POST** /ttms/1.0.0/topology_tag | Create a named topology tag


# **ttms100_topology_tag_by_topotaguuid_delete**
> ttms100_topology_tag_by_topotaguuid_delete(topotaguuid => $topotaguuid)

Delete a topology tag

Delete a topology tag

### Example 
```perl
use Data::Dumper;
use TelstraTPN::Configuration;
use TelstraTPN::TopologiesApi;

my $api_instance = TelstraTPN::TopologiesApi->new();
my $topotaguuid = 'topotaguuid_example'; # string | Unique identifier representing a specific topology tag

eval { 
    $api_instance->ttms100_topology_tag_by_topotaguuid_delete(topotaguuid => $topotaguuid);
};
if ($@) {
    warn "Exception when calling TopologiesApi->ttms100_topology_tag_by_topotaguuid_delete: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **topotaguuid** | **string**| Unique identifier representing a specific topology tag | 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **ttms100_topology_tag_by_topotaguuid_get**
> Topology ttms100_topology_tag_by_topotaguuid_get(topotaguuid => $topotaguuid)

Get information about the specified topology tag

Get information about the specified topology tag

### Example 
```perl
use Data::Dumper;
use TelstraTPN::Configuration;
use TelstraTPN::TopologiesApi;

my $api_instance = TelstraTPN::TopologiesApi->new();
my $topotaguuid = 'topotaguuid_example'; # string | Unique identifier representing a specific topology tag

eval { 
    my $result = $api_instance->ttms100_topology_tag_by_topotaguuid_get(topotaguuid => $topotaguuid);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling TopologiesApi->ttms100_topology_tag_by_topotaguuid_get: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **topotaguuid** | **string**| Unique identifier representing a specific topology tag | 

### Return type

[**Topology**](Topology.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **ttms100_topology_tag_by_topotaguuid_put**
> Topology ttms100_topology_tag_by_topotaguuid_put(topotaguuid => $topotaguuid, body => $body)

Update a topology tag's name and/or description

Update a topology tag's name and/or description

### Example 
```perl
use Data::Dumper;
use TelstraTPN::Configuration;
use TelstraTPN::TopologiesApi;

my $api_instance = TelstraTPN::TopologiesApi->new();
my $topotaguuid = 'topotaguuid_example'; # string | Unique identifier representing a specific topology tag
my $body = TelstraTPN::Object::Ttms100TopologyTagRequest->new(); # Ttms100TopologyTagRequest | 

eval { 
    my $result = $api_instance->ttms100_topology_tag_by_topotaguuid_put(topotaguuid => $topotaguuid, body => $body);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling TopologiesApi->ttms100_topology_tag_by_topotaguuid_put: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **topotaguuid** | **string**| Unique identifier representing a specific topology tag | 
 **body** | [**Ttms100TopologyTagRequest**](Ttms100TopologyTagRequest.md)|  | [optional] 

### Return type

[**Topology**](Topology.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **ttms100_topology_tag_get**
> ARRAY[Topology] ttms100_topology_tag_get()

List all topology tags

List all topology tags

### Example 
```perl
use Data::Dumper;
use TelstraTPN::Configuration;
use TelstraTPN::TopologiesApi;

my $api_instance = TelstraTPN::TopologiesApi->new();

eval { 
    my $result = $api_instance->ttms100_topology_tag_get();
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling TopologiesApi->ttms100_topology_tag_get: $@\n";
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**ARRAY[Topology]**](Topology.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **ttms100_topology_tag_objects_by_topotaguuid_get**
> Ttms100TopologyTagObjectsResponse ttms100_topology_tag_objects_by_topotaguuid_get(topotaguuid => $topotaguuid)

List objects for Topology

List all objects (Endpoints, Links, VPorts, etc.) associated with the topology tag.

### Example 
```perl
use Data::Dumper;
use TelstraTPN::Configuration;
use TelstraTPN::TopologiesApi;

my $api_instance = TelstraTPN::TopologiesApi->new();
my $topotaguuid = 'topotaguuid_example'; # string | Unique identifier representing a specific topology tag

eval { 
    my $result = $api_instance->ttms100_topology_tag_objects_by_topotaguuid_get(topotaguuid => $topotaguuid);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling TopologiesApi->ttms100_topology_tag_objects_by_topotaguuid_get: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **topotaguuid** | **string**| Unique identifier representing a specific topology tag | 

### Return type

[**Ttms100TopologyTagObjectsResponse**](Ttms100TopologyTagObjectsResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **ttms100_topology_tag_post**
> Topology ttms100_topology_tag_post(body => $body)

Create a named topology tag

Create a named topology tag

### Example 
```perl
use Data::Dumper;
use TelstraTPN::Configuration;
use TelstraTPN::TopologiesApi;

my $api_instance = TelstraTPN::TopologiesApi->new();
my $body = TelstraTPN::Object::Ttms100TopologyTagRequest->new(); # Ttms100TopologyTagRequest | 

eval { 
    my $result = $api_instance->ttms100_topology_tag_post(body => $body);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling TopologiesApi->ttms100_topology_tag_post: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**Ttms100TopologyTagRequest**](Ttms100TopologyTagRequest.md)|  | [optional] 

### Return type

[**Topology**](Topology.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

