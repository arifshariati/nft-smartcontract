// SPDX-License-Identifier: MIT License

pragma solidity ^0.8.11;

import "./IERC721.sol";

contract Market {

    enum ListingStatus {

        Active,
        Sold,
        Canceled

    }

    struct Listing {
        
        ListingStatus status;
        address seller;
        address token;
        uint tokenId;
        uint price;

    }

    event Listed(
        uint listingId,
        address seller,
        address token,
        uint tokenId,
        uint price
    );

    event Sale(
        uint listingId,
        address buyer,
        address token,
        uint tokenId,
        uint price
    );

    uint private _listingId = 0;

    mapping(uint => Listing) private _listings;

    function listTokens(address token, uint tokenId, uint price) external {

        IERC721(token).transferFrom(msg.sender, address(this), tokenId);

        Listing memory listing = Listing(
            ListingStatus.Active,
            msg.sender,
            token, 
            tokenId, 
            price
        );

        _listingId++;

        _listings[_listingId] = listing;

        emit Listed(_listingId, msg.sender, token, tokenId, price);

    }

    function buyToken(uint listingId) external payable {

        Listing storage listing = _listings[listingId];

        require(msg.sender != listing.seller, "Seller can not be buyer");
        require(listing.status == ListingStatus.Active,"Listing is not Active");
        require(msg.value >= listing.price, "Insufficient Balance");
        
        IERC721(listing.token).transferFrom(address(this),msg.sender, listing.tokenId);

        payable(listing.seller).transfer(listing.price);

        emit Sale(
            listingId,
            msg.sender,
            listing.token,
            listing.tokenId,
            listing.price
        );

    }

    function cancel(uint listingId) public {

        Listing storage listing = _listings[listingId];

        require(msg.sender != listing.seller, "Only Seller can cancel listing");
        require(listing.status == ListingStatus.Active,"Listing is not Active");

        listing.status = ListingStatus.Canceled;

        IERC721(listing.token).transferFrom(address(this),msg.sender, listing.tokenId);

    }
}

