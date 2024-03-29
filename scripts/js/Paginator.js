// Generated by CoffeeScript 1.3.1

/**
   * @class
   * @property {Array} itemList An list of items to paginate
   * @property {number} itemsPerPage The number of items to show on a page
   * @property {number} currentPageNumber The current page on display
*/


(function() {
  var Paginator, _base;

  Paginator = (function() {

    Paginator.name = 'Paginator';

    /**
       * @global
       * @constructor 
       * @param {Object} options An object literal containing parameters
       * @example flightlist = new Paginator {itemList: arrayOfFlights, itemsPerPage: 5}
    */


    function Paginator(options) {
      var defaults;
      defaults = {
        itemList: [],
        itemsPerPage: 5
      };
      options = $.extend({}, defaults, options);
      /** @default []
      */

      this.itemList = options.itemList;
      /** @default 5
      */

      this.itemsPerPage = options.itemsPerPage;
      /** @default 1
      */

      this.currentPageNumber = 1;
    }

    /**
       * Sets the itemList property
       * @memberOf Paginator
       * @function
       * @param {Array} newListOfItems An array of items to paginate
       * @example flightList.setItemList ["Jamaica", "Trinidad", "Barbados"]
    */


    Paginator.prototype.setItemList = function(newListOfItems) {
      return this.itemList = newListOfItems;
    };

    /**
       * Sets the itemsPerPage property
       * @memberOf Paginator
       * @function
       * @param {number} numberOfItemsPerPage The number of items to show on a page
       * @example flightList.setItemsPerPage 10
    */


    Paginator.prototype.setItemsPerPage = function(numberOfItemsPerPage) {
      return this.itemsPerPage = numberOfItemsPerPage;
    };

    /**
       * Sets the currentPageNumber property
       * @memberOf Paginator
       * @function
       * @param {number} pageNumber Set the current page
       * @example flightList.setCurrentPageNumber 3
    */


    Paginator.prototype.setCurrentPageNumber = function(pageNumber) {
      return this.currentPageNumber = pageNumber;
    };

    /**
       * Gets the itemList property
       * @memberOf Paginator
       * @function
       * @returns {Array} The array of items to paginate
       * @example flightList.getItemList()
    */


    Paginator.prototype.getItemList = function() {
      return this.itemList;
    };

    /**
       * Gets the itemsPerPage property
       * @memberOf Paginator
       * @function
       * @returns {number} The number of items to show on a page
       * @example flightList.getItemsPerPage()
    */


    Paginator.prototype.getItemsPerPage = function() {
      return this.itemsPerPage;
    };

    /**
       * Gets the total number of pages
       * @memberOf Paginator
       * @function
       * @returns {number} The total number of pages for the list
       * @example flightList.getNumberOfPages()
    */


    Paginator.prototype.getNumberOfPages = function() {
      return Math.ceil(this.getItemList().length / this.getItemsPerPage());
    };

    /**
       * Gets the currentPageNumber property
       * @memberOf Paginator
       * @function
       * @returns {number} The current page on display
       * @example flightList.getCurrentPageNumber 3
    */


    Paginator.prototype.getCurrentPageNumber = function() {
      return this.currentPageNumber;
    };

    /**
       * Gets a page of items
       * @memberOf Paginator
       * @function
       * @param {number} pageNumber The page to display
       * @returns {Array} The list of items on a page
       * @example flightList.getPage 3
    */


    Paginator.prototype.getPage = function(pageNumber) {
      this.setCurrentPageNumber(pageNumber);
      return this.itemList.slice((pageNumber - 1) * this.itemsPerPage, pageNumber * this.itemsPerPage);
    };

    /**
       * Gets the current page of items
       * @memberOf Paginator
       * @function
       * @returns {Array} The list of items on the current page
       * @example flightList.getCurrentPage()
    */


    Paginator.prototype.getCurrentPage = function() {
      var currentPage;
      currentPage = this.getCurrentPageNumber();
      return this.getPage(currentPage);
    };

    /**
       * Gets the next page of items
       * @memberOf Paginator
       * @function
       * @returns {Array|false} The list of items on the next page or false
       * @example flightList.getNextPage()
    */


    Paginator.prototype.getNextPage = function() {
      var nextPageNumber;
      if (this.isLastPage()) {
        return false;
      }
      nextPageNumber = this.getCurrentPageNumber() + 1;
      return this.getPage(nextPageNumber);
    };

    /**
       * Gets the previous page of items
       * @memberOf Paginator
       * @function
       * @returns {Array|false} The list of items on the previous page or false
       * @example flightList.getPreviousPage()
    */


    Paginator.prototype.getPreviousPage = function() {
      var previousPageNumber;
      if (this.isFirstPage()) {
        return false;
      }
      previousPageNumber = this.getCurrentPageNumber() - 1;
      return this.getPage(previousPageNumber);
    };

    /**
       * Checks if the Paginator is on the last page
       * @memberOf Paginator
       * @function
       * @returns {boolean} True, if the Paginator is on the last page.  False otherwise.
       * @example flightList.isLastPage()
    */


    Paginator.prototype.isLastPage = function() {
      return this.getCurrentPageNumber() === this.getNumberOfPages();
    };

    /**
       * Checks if the Paginator is on the first page
       * @memberOf Paginator
       * @function
       * @returns {boolean} True, if the Paginator is on the first page.  False otherwise.
       * @example flightList.isFirstPage()
    */


    Paginator.prototype.isFirstPage = function() {
      return this.getCurrentPageNumber() === 1;
    };

    return Paginator;

  })();

  if (window.SKB == null) {
    window.SKB = {};
  }

  if ((_base = window.SKB).Paginator == null) {
    _base.Paginator = Paginator;
  }

}).call(this);
