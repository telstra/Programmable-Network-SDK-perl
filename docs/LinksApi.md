# TelstraTPN::LinksApi

## Load the API package
```perl
use TelstraTPN::Object::LinksApi;
```

All URIs are relative to *https://penapi.pacnetconnect.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**100_inventory_link_post**](LinksApi.md#100_inventory_link_post) | **POST** /1.0.0/inventory/link | Create Link and initial Contract
[**100_inventory_links_by_linkid_get**](LinksApi.md#100_inventory_links_by_linkid_get) | **GET** /1.0.0/inventory/links/{linkid} | Get details of specified link
[**100_inventory_links_customer_by_customeruuid_get**](LinksApi.md#100_inventory_links_customer_by_customeruuid_get) | **GET** /1.0.0/inventory/links/customer/{customeruuid} | Get active Links
[**100_inventory_links_history_by_linkid_get**](LinksApi.md#100_inventory_links_history_by_linkid_get) | **GET** /1.0.0/inventory/links/history/{linkid} | Get Link history


# **100_inventory_link_post**
> Model100InventoryLinkResponse 100_inventory_link_post(body => $body)

Create Link and initial Contract

Create Link and initial Contract

### Example 
```perl
use Data::Dumper;
use TelstraTPN::Configuration;
use TelstraTPN::LinksApi;

my $api_instance = TelstraTPN::LinksApi->new();
my $body = TelstraTPN::Object::Model100InventoryLinkRequest->new(); # Model100InventoryLinkRequest | 

eval { 
    my $result = $api_instance->100_inventory_link_post(body => $body);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling LinksApi->100_inventory_link_post: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**Model100InventoryLinkRequest**](Model100InventoryLinkRequest.md)|  | [optional] 

### Return type

[**Model100InventoryLinkResponse**](Model100InventoryLinkResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **100_inventory_links_by_linkid_get**
> Model100InventoryLinksResponse 100_inventory_links_by_linkid_get(linkid => $linkid)

Get details of specified link

Get details of specified link

### Example 
```perl
use Data::Dumper;
use TelstraTPN::Configuration;
use TelstraTPN::LinksApi;

my $api_instance = TelstraTPN::LinksApi->new();
my $linkid = 'linkid_example'; # string | Unique identifier representing a specific link

eval { 
    my $result = $api_instance->100_inventory_links_by_linkid_get(linkid => $linkid);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling LinksApi->100_inventory_links_by_linkid_get: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **linkid** | **string**| Unique identifier representing a specific link | 

### Return type

[**Model100InventoryLinksResponse**](Model100InventoryLinksResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **100_inventory_links_customer_by_customeruuid_get**
> ARRAY[Link] 100_inventory_links_customer_by_customeruuid_get(customeruuid => $customeruuid)

Get active Links

Get active Links

### Example 
```perl
use Data::Dumper;
use TelstraTPN::Configuration;
use TelstraTPN::LinksApi;

my $api_instance = TelstraTPN::LinksApi->new();
my $customeruuid = 'customeruuid_example'; # string | Unique identifier representing a specific customer

eval { 
    my $result = $api_instance->100_inventory_links_customer_by_customeruuid_get(customeruuid => $customeruuid);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling LinksApi->100_inventory_links_customer_by_customeruuid_get: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **customeruuid** | **string**| Unique identifier representing a specific customer | 

### Return type

[**ARRAY[Link]**](Link.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **100_inventory_links_history_by_linkid_get**
> Model100InventoryLinksHistoryResponse 100_inventory_links_history_by_linkid_get(linkid => $linkid)

Get Link history

Get Link history

### Example 
```perl
use Data::Dumper;
use TelstraTPN::Configuration;
use TelstraTPN::LinksApi;

my $api_instance = TelstraTPN::LinksApi->new();
my $linkid = 'linkid_example'; # string | Unique identifier representing a specific link

eval { 
    my $result = $api_instance->100_inventory_links_history_by_linkid_get(linkid => $linkid);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling LinksApi->100_inventory_links_history_by_linkid_get: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **linkid** | **string**| Unique identifier representing a specific link | 

### Return type

[**Model100InventoryLinksHistoryResponse**](Model100InventoryLinksHistoryResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

