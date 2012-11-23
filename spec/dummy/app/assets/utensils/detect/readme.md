
# Detect
Utility class of static variables describing various browser support for
properties, normalizing event names, and other useful detection.

## API

### #transition
Get the transition event name for the current browser for use in css transitions

```coffee
@tranny_event = utensils.Detect.transition.end
```
### #hasTransition
Boolean value based on the browsers support for transitions

```coffee
$(el).on(utensils.Detect.transition.end, @onDone) if utensils.Detect.hasTransition
```

### Requires
- `utensils/utensils`

