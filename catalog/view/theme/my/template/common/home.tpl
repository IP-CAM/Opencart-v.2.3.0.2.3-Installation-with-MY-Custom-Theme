<?php echo $header; ?>
<div class="container">
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?></div>
    <?php echo $column_right; ?></div>
</div>
<div class="container">
  <div class="row">
<?php echo $content_bottom; ?>
</div>
</div>
<?php echo $footer; ?>
     <script type="application/ld+json">
    {
      "@context": "https://schema.org",
      "@type": "WebSite",
      "url": "https://vesyuniversal.com/",
      "potentialAction": {
        "@type": "SearchAction",
        "target": "https://vesyuniversal.com/search/?search={search_term_string}",
        "query-input": "required name=search_term_string"
      }
    }
    </script>
 <script type="application/ld+json">
        {
          "@context": "https://schema.org",
          "@type": "Store",
          "name": "Весы Универсал",
          "image": "https://vesyuniversal.com/image/catalog/headervesi2.png",
          "logo": "https://vesyuniversal.com/image/catalog/headervesi2.png",
          "@id": "https://vesyuniversal.com",
          "url": "https://vesyuniversal.com",
          "telephone": "+380950417331",         
          "priceRange": "От 1 гривны",
          "address": {
            "@type": "PostalAddress",
            "streetAddress": "ынок 1й километр, магазин Универсал",
            "addressLocality": "Харьков",
            "addressCountry": "Украина"
          },
          "openingHoursSpecification": {
            "@type": "OpeningHoursSpecification",
            "dayOfWeek": [
              "Monday",
              "Tuesday",
              "Wednesday",
              "Thursday",
              "Friday",
              "Saturday",
              "Sunday"
            ],
            "opens": "09:00",
            "closes": "18:00"
          }
        }
        </script>