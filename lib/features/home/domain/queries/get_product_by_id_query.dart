String getProductByIdQuery = r"""query Product ($id:ID){
    product(id: $id) {
        availableForSale
        createdAt
        description
        descriptionHtml
        encodedVariantAvailability
        encodedVariantExistence
        handle
        id
        isGiftCard
        onlineStoreUrl
        productType
        publishedAt
        requiresSellingPlan
        tags
        title
        totalInventory
        trackingParameters
        updatedAt
        vendor
    }
}
""";
