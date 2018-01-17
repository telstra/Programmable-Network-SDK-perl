# TelstraTPN::VnfsApi

## Load the API package
```perl
use TelstraTPN::Object::VnfsApi;
```

All URIs are relative to *https://penapi.pacnetconnect.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**marketplace_image_get**](VnfsApi.md#marketplace_image_get) | **GET** /1.0.0/marketplace/image | List images in the Marketplace


# **marketplace_image_get**
> MarketplaceImageResponse marketplace_image_get()

List images in the Marketplace

List images in the Marketplace

### Example 
```perl
use Data::Dumper;
use TelstraTPN::VnfsApi;
my $api_instance = TelstraTPN::VnfsApi->new(

    # Configure OAuth2 access token for authorization: auth
    access_token => 'YOUR_ACCESS_TOKEN',
);


eval { 
    my $result = $api_instance->marketplace_image_get();
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling VnfsApi->marketplace_image_get: $@\n";
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**MarketplaceImageResponse**](MarketplaceImageResponse.md)

### Authorization

[auth](../README.md#auth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

