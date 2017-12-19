# TelstraTPN::VnfsApi

## Load the API package
```perl
use TelstraTPN::Object::VnfsApi;
```

All URIs are relative to *https://penapi.pacnetconnect.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**100_marketplace_image_get**](VnfsApi.md#100_marketplace_image_get) | **GET** /1.0.0/marketplace/image | List images in the Marketplace


# **100_marketplace_image_get**
> Model100MarketplaceImageResponse 100_marketplace_image_get()

List images in the Marketplace

List images in the Marketplace

### Example 
```perl
use Data::Dumper;
use TelstraTPN::Configuration;
use TelstraTPN::VnfsApi;

my $api_instance = TelstraTPN::VnfsApi->new();

eval { 
    my $result = $api_instance->100_marketplace_image_get();
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling VnfsApi->100_marketplace_image_get: $@\n";
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**Model100MarketplaceImageResponse**](Model100MarketplaceImageResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

