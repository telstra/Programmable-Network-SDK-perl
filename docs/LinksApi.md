# TelstraTPN::LinksApi

## Load the API package
```perl
use TelstraTPN::Object::LinksApi;
```

All URIs are relative to *https://penapi.pacnetconnect.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**inventory_link_post**](LinksApi.md#inventory_link_post) | **POST** /1.0.0/inventory/link | Create Link and initial Contract
[**inventory_links_by_linkid_get**](LinksApi.md#inventory_links_by_linkid_get) | **GET** /1.0.0/inventory/links/{linkid} | Get details of specified link
[**inventory_links_customer_by_customeruuid_get**](LinksApi.md#inventory_links_customer_by_customeruuid_get) | **GET** /1.0.0/inventory/links/customer/{customeruuid} | Get active Links
[**inventory_links_history_by_linkid_get**](LinksApi.md#inventory_links_history_by_linkid_get) | **GET** /1.0.0/inventory/links/history/{linkid} | Get Link history


# **inventory_link_post**
> InventoryLinkResponse inventory_link_post(body => $body)

Create Link and initial Contract

Create Link and initial Contract

### Example 
```perl
use Data::Dumper;
use TelstraTPN::LinksApi;
my $api_instance = TelstraTPN::LinksApi->new(

    # Configure OAuth2 access token for authorization: auth
    access_token => 'YOUR_ACCESS_TOKEN',
);

my $body = TelstraTPN::Object::InventoryLinkRequest->new(); # InventoryLinkRequest | 

eval { 
    my $result = $api_instance->inventory_link_post(body => $body);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling LinksApi->inventory_link_post: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**InventoryLinkRequest**](InventoryLinkRequest.md)|  | [optional] 

### Return type

[**InventoryLinkResponse**](InventoryLinkResponse.md)

### Authorization

[auth](../README.md#auth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **inventory_links_by_linkid_get**
> InventoryLinksResponse inventory_links_by_linkid_get(linkid => $linkid)

Get details of specified link

Get details of specified link

### Example 
```perl
use Data::Dumper;
use TelstraTPN::LinksApi;
my $api_instance = TelstraTPN::LinksApi->new(

    # Configure OAuth2 access token for authorization: auth
    access_token => 'YOUR_ACCESS_TOKEN',
);

my $linkid = 'linkid_example'; # string | Unique identifier representing a specific link

eval { 
    my $result = $api_instance->inventory_links_by_linkid_get(linkid => $linkid);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling LinksApi->inventory_links_by_linkid_get: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **linkid** | **string**| Unique identifier representing a specific link | 

### Return type

[**InventoryLinksResponse**](InventoryLinksResponse.md)

### Authorization

[auth](../README.md#auth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **inventory_links_customer_by_customeruuid_get**
> ARRAY[Link] inventory_links_customer_by_customeruuid_get(customeruuid => $customeruuid)

Get active Links

Get active Links

### Example 
```perl
use Data::Dumper;
use TelstraTPN::LinksApi;
my $api_instance = TelstraTPN::LinksApi->new(

    # Configure OAuth2 access token for authorization: auth
    access_token => 'YOUR_ACCESS_TOKEN',
);

my $customeruuid = 'customeruuid_example'; # string | Unique identifier representing a specific customer

eval { 
    my $result = $api_instance->inventory_links_customer_by_customeruuid_get(customeruuid => $customeruuid);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling LinksApi->inventory_links_customer_by_customeruuid_get: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **customeruuid** | **string**| Unique identifier representing a specific customer | 

### Return type

[**ARRAY[Link]**](Link.md)

### Authorization

[auth](../README.md#auth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **inventory_links_history_by_linkid_get**
> InventoryLinksHistoryResponse inventory_links_history_by_linkid_get(linkid => $linkid)

Get Link history

Get Link history

### Example 
```perl
use Data::Dumper;
use TelstraTPN::LinksApi;
my $api_instance = TelstraTPN::LinksApi->new(

    # Configure OAuth2 access token for authorization: auth
    access_token => 'YOUR_ACCESS_TOKEN',
);

my $linkid = 'linkid_example'; # string | Unique identifier representing a specific link

eval { 
    my $result = $api_instance->inventory_links_history_by_linkid_get(linkid => $linkid);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling LinksApi->inventory_links_history_by_linkid_get: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **linkid** | **string**| Unique identifier representing a specific link | 

### Return type

[**InventoryLinksHistoryResponse**](InventoryLinksHistoryResponse.md)

### Authorization

[auth](../README.md#auth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

