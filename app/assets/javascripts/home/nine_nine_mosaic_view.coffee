class NineNineMosaicView extends Backbone.View

  tagName: "ul"
  
  initialize: (opts = {}) ->
    @el= opts.el || $ "ul.nine_nine_mosaic" 
    @imageItems= $(@el).find "li.item.image_mosaic_panel"
    @textItems= $(@el).find "li.item.text_mosaic_panel"
    
    @mosaicOptions= 
      itemSelector : "li" 
      filter: ".shown"
      layoutMode : 'fitRows'
#      sortBy: 'randomWithVoidInCenterSorting'
#      getSortData: 
#        "randomWithVoidInCenter" : @randomWithVoidInCenterSorting
    @render()
    
  render: () =>
    @createVoidPanels()
    @imageItems.detach()
    setTimeout () =>
      @showMosaic()
    , 100
    
  createVoidPanels: () ->
    @voidPanels=[]
    @centerVoid= $("<li class='center_void void_item'><div></div></li>")
    @voidPanels= ($("<li class='void_item'><div></div></li>.") for item in [0..7]) 
    voidPanelsToAttachCount = 9 - $(@el).find(".item").length - 1 #minus main logo and center panel
    @voidPanels[index].appendTo(@el) for index in [0...voidPanelsToAttachCount]
  
  showMosaic: () =>
    $(@el).find("li").fadeOut()
#    @mosaicOptions.filter= "none"
#    $(@el).isotope(@mosaicOptions);
    setTimeout () =>
      @rebuildMosaic()
      $(@el).find("li").fadeIn()
    , 600
    
#    $(@el).find(".logo").addClass "shown"
#    $(@el).find(".center_void").addClass "shown"
#    $(@el).find("li").addClass "shown"
#    #$(@el).isotope(@mosaicOptions);
#    @mosaicOptions.filter= ".shown"
    setTimeout () =>
#      setTimeout () =>
      @showMosaic()
#      , 2000
    , 2500
  
  
  rebuildMosaic: () =>
    currentElems = $(@el).find("li.item, li.void_item").detach()
    @randomizePanels( @imageItems) and @randomizePanels( @textItems)
    imagePanelsToShow= @imageItems[0...Math.ceil(1 + Math.random()*2)]
    textPanelsToShow= @textItems[0]
    newMosaic= @voidPanels[0...7-imagePanelsToShow.length]
    newMosaic.push imagePanel for imagePanel in imagePanelsToShow
    newMosaic.push textPanelsToShow
    @randomizePanels newMosaic
    currentCenterItem = newMosaic[4]
    newMosaic[3]= @centerVoid
    newMosaic.push currentCenterItem 
    $(mosaicItem).appendTo $(@el) for mosaicItem in newMosaic
#    @centerVoid.appendTo @el 
#    voidPanelsToAttachCount = 9 - newItems.length - 2 #minus main logo and center panel
#    @voidPanels[index].appendTo(@el) for index in [0...voidPanelsToAttachCount]
#    @randomizePanels()  
  
  randomizePanels: (panels) ->
    panels.sort (item) -> 
      Math.round(Math.random())-0.5
      
  
(exports ? this).NineNineMosaicView = NineNineMosaicView

