
# Example - setNeedsLayout vs layoutIfNeeded vs layoutSubviews()

#### Summary :

layoutIfNeeded is a synchronous call that will let the system update the views and force the layout engine to redraw the views.
setNeedsLayout is a deferred call and asynchronous call that will mark the layout has changed but it will call layoutSubViews() in the next cycle.
Both layoutIfNeeded and setNeedsLayout call layoutSubViews()


#### Screenshots :

<h1>setNeedsLayout Example</h1>
<img src= "https://github.com/sabapathyk7/LayoutSubViewsExample/assets/40764138/86f76c00-80af-45e0-b65e-e7f8182620f8" height = 550> 

<h1>layoutIfNeeded Example</h1>
<img src= "https://github.com/sabapathyk7/LayoutSubViewsExample/assets/40764138/aeaa8fb4-3a2d-4c28-85ad-b63d1444c66e" height = 550> 
