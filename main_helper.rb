module Themes::EShop::MainHelper
  def self.included(klass)
    klass.helper_method [:e_shop_add_main_slider] rescue "" # here your methods accessible from views
  end

  def e_shop_settings(theme)
  end

  # callback called after theme installed
  def e_shop_on_install_theme(theme)
    unless theme.site.nav_menus.where(slug: "eshop_footer_main_menu").present? # verify if theme was installed before
      group = theme.add_field_group({name: "Home Slider", slug: "home_slider", description: ""})
      # group.add_field({"name"=>"Text Slider", "slug"=>"home_slider_tabs"},{field_key: "text_box", translate: true, multiple: true})
      # group.add_field({"name"=>"Home Slider Image (1000px1000px)", "slug"=>"home_slider_bg"},{field_key: "image" })
      # group.add_field({"name"=>"Home Slider Product", "slug"=>"home_slider_product"},{field_key: "select_eval", required: true, command: 'options_from_collection_for_select(current_site.the_posts("commerce").decorate, :id, :the_title)' })
      # theme.save_field_value('home_slider_tabs', ['One Click Installation', 'Easy Configuration', 'Easy Administration', 'Shop Online'])

      menu = current_site.nav_menus.create(name: "E-shop Header Menu", slug: "eshop_header_main_menu")
      menu.append_menu_item({label: "Home", type: "external", link: "root_url"})
      menu_item = menu.append_menu_item({label: "MEN", type: "external", link: "#"})
      new_in = menu_item.append_menu_item({label: "NEW IN", type: "external", link: "#"})
      new_in.append_menu_item({label: "New in Clothing", type: "external", link: "#"})
      new_in.append_menu_item({label: "New in Bags", type: "external", link: "#"})
      new_in.append_menu_item({label: "New in Shoes", type: "external", link: "#"})
      new_in.append_menu_item({label: "New in Watches", type: "external", link: "#"})

      new_in = menu_item.append_menu_item({label: "Clothing", type: "external", link: "#"})
      new_in.append_menu_item({label: "New in Clothing", type: "external", link: "#"})
      new_in.append_menu_item({label: "New in Bags", type: "external", link: "#"})
      new_in.append_menu_item({label: "New in Shoes", type: "external", link: "#"})

      new_in = menu_item.append_menu_item({label: "Clothing", type: "external", link: "#"})
      new_in.append_menu_item({label: "New in Clothing", type: "external", link: "#"})
      new_in.append_menu_item({label: "New in Bags", type: "external", link: "#"})
      new_in.append_menu_item({label: "New in Shoes", type: "external", link: "#"})
      new_in.append_menu_item({label: "New in Watches", type: "external", link: "#"})

      new_in = menu.append_menu_item({label: "WOMEN", type: "external", link: "#"})
      new_in.append_menu_item({label: "New in Clothing", type: "external", link: "#"})
      new_in.append_menu_item({label: "New in Bags", type: "external", link: "#"})
      new_in.append_menu_item({label: "New in Shoes", type: "external", link: "#"})
      new_in.append_menu_item({label: "New in Watches", type: "external", link: "#"})

      new_in = menu.append_menu_item({label: "KIDS", type: "external", link: "#"})
      new_in.append_menu_item({label: "New in Clothing", type: "external", link: "#"})
      new_in.append_menu_item({label: "New in Bags", type: "external", link: "#"})
      new_in.append_menu_item({label: "New in Shoes", type: "external", link: "#"})
      new_in.append_menu_item({label: "New in Watches", type: "external", link: "#"})

      pt_pages = current_site.post_types.where(slug: "page").first
      page = pt_pages.add_post(title: "Contact Form", content: '<p><iframe style="border: 0;" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d6632.248000703498!2d151.265683!3d-33.7832959!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x6b12abc7edcbeb07%3A0x5017d681632bfc0!2sManly+Vale+NSW+2093%2C+Australia!5e0!3m2!1sen!2sin!4v1433329298259" width="100%" height="330"></iframe></p> <p>[forms slug=eshop]</p>') if pt_pages.present?
      menu.append_menu_item({label: "Contact", type: "post", link: page.id})

      # footer menus
      menu = current_site.nav_menus.create(name: "E-shop Footer Menu", slug: "eshop_footer_main_menu")
      item = menu.append_menu_item({label: "Show", type: "external", link: '#'})
      item.append_menu_item({label: "New Arrivals", type: "external", link: '#'})
      item.append_menu_item({label: "Men", type: "external", link: '#'})
      item.append_menu_item({label: "Women", type: "external", link: '#'})
      item.append_menu_item({label: "Accessories", type: "external", link: '#'})
      item.append_menu_item({label: "Kids", type: "external", link: '#'})
      item.append_menu_item({label: "Brands", type: "external", link: '#'})

      item = menu.append_menu_item({label: "Help", type: "external", link: '#'})
      item.append_menu_item({label: "New Arrivals", type: "external", link: '#'})
      item.append_menu_item({label: "Men", type: "external", link: '#'})
      item.append_menu_item({label: "Women", type: "external", link: '#'})
      item.append_menu_item({label: "Accessories", type: "external", link: '#'})
      item.append_menu_item({label: "Kids", type: "external", link: '#'})
      item.append_menu_item({label: "Brands", type: "external", link: '#'})

      item = menu.append_menu_item({label: "Popular", type: "external", link: '#'})
      item.append_menu_item({label: "New Arrivals", type: "external", link: '#'})
      item.append_menu_item({label: "Men", type: "external", link: '#'})
      item.append_menu_item({label: "Women", type: "external", link: '#'})
      item.append_menu_item({label: "Accessories", type: "external", link: '#'})
      item.append_menu_item({label: "Kids", type: "external", link: '#'})
      item.append_menu_item({label: "Brands", type: "external", link: '#'})

      e_shop_add_main_slider
    end

    if current_site.plugin_installed?('ecommerce')
      eshop_ecommerce_after_install({})
    else
      plugin_install('ecommerce')
    end

    plugin_install('cama_subscriber') unless current_site.plugin_installed?('cama_subscriber')

    ### Forms
    plugin_install('cama_contact_form') unless current_site.plugin_installed?('cama_contact_form')
    form_eshop = current_site.contact_forms.create(name: "eshop", slug: "eshop", settings: '{"railscf_mail":{"previous_html":"\u003cdiv class=\'contact-form\'\u003e","after_html":"\u003c/div\u003e","to":"owenperedo@gmail.com","subject":"\u003c!--:en--\u003eSite contact\u003c!--:--\u003e\u003c!--:es--\u003eSite contact\u003c!--:--\u003e","body":"\u003c!--:en--\u003easdasdasdasdas\u003c!--:--\u003e\u003c!--:es--\u003e\u003c!--:--\u003e","to_answer":"[c7]","subject_answer":"\u003c!--:en--\u003eThanks for contact us\u003c!--:--\u003e\u003c!--:es--\u003egrcas\u003c!--:--\u003e","body_answer":"\u003c!--:en--\u003easdasdas\u003c!--:--\u003e\u003c!--:es--\u003e\u003c!--:--\u003e"},"railscf_message":{"mail_sent_ok":"","mail_sent_ng":"","invalid_required":"","invalid_email":"","captcha_not_match":""},"railscf_form_button":{"name_button":"Send"}}', value: '{"fields":[{"field_type":"text","cid":"c2","label":"\u003c!--:en--\u003eName\u003c!--:--\u003e\u003c!--:es--\u003eNombre\u003c!--:--\u003e","required":"true","field_options":{"description":"","field_class":"na","template":"\u003cdiv class=\'contact-left\'\u003e\r\n[ci]","field_attributes":"{\"placeholder\": \"[label ci]\"}"},"default_value":""},{"field_type":"email","cid":"c7","label":"\u003c!--:en--\u003eEmail\u003c!--:--\u003e\u003c!--:es--\u003eCorreo\u003c!--:--\u003e","required":"true","field_options":{"description":"","field_class":"na","template":"[ci]","field_attributes":"{\"placeholder\": \"[label ci]\"}"},"default_value":""},{"field_type":"text","cid":"c4","label":"\u003c!--:en--\u003eSubject\u003c!--:--\u003e\u003c!--:es--\u003eAsunto\u003c!--:--\u003e","required":"true","field_options":{"description":"","field_class":"na","template":"[ci]\r\n\u003c/div\u003e","field_attributes":"{\"placeholder\": \"[label ci]\"}"},"default_value":""},{"field_type":"paragraph","cid":"c5","label":"\u003c!--:en--\u003eMessage\u003c!--:--\u003e\u003c!--:es--\u003eMensaje\u003c!--:--\u003e","required":"true","field_options":{"description":"","field_class":"na","template":"\u003cdiv class=\'contact-right\'\u003e\r\n[ci]\r\n\u003c/div\u003e\r\n","field_attributes":"{\"placeholder\": \"[label ci]\"}"},"default_value":""},{"field_type":"submit","cid":"c6","label":"\u003c!--:en--\u003eSubmit\u003c!--:--\u003e\u003c!--:es--\u003eEnviar\u003c!--:--\u003e","field_options":{"description":"","field_class":"na","template":"\u003cdiv class=\"clearfix\"\u003e\u003c/div\u003e\r\n[ci]","field_attributes":""}}]}')

  end

  # callback executed after theme uninstalled (here you can destroy all items created by the theme on installation)
  def e_shop_on_uninstall_theme(theme)
    post_type = current_site.the_post_type('commerce')
    if post_type.present?
      post_type.set_option('posts_image_dimension', current_theme.get_option('backup_posts_feature_image_dimension'))
    end
    #theme.destroy
  end

  def e_shop_before_front_load
    # shortcode_add("bootstrap_slider", lambda{|attrs, args| "here boots slider " })
    # shortcode_add("redirect", lambda{|attrs, args| "Here redirect " })
    # shortcode_add("owen_code", lambda{|attrs, args| "Here owen code " })
  end

  def eshop_ecommerce_after_install(args)
    post_type = current_site.the_post_type('commerce')
    if post_type.present?
      current_theme.set_option('backup_posts_feature_image_dimension', post_type.get_option('posts_image_dimension'))
      post_type.set_option('posts_image_dimension', '380x480')
      post_type.get_option('posts_thumb_size', '277x396')
      field = post_type.get_field_object('ecommerce_photos')
      field.set_options({dimension: '760x1100'}) if field.present?
    end
  end

  def eshop_custom_inputs_for_products(args)
    args[:html] << render(partial: theme_view('admin/extra_product_form'), locals:{args: args }) if args[:post_type].slug == 'commerce'
  end


  def eshop_extra_custom_fields(args)
    args[:fields][:my_slider] = {
        key: 'my_slider',
        label: 'My Slider',
        render: theme_view('custom_field/my_slider.html.erb'),
        options: {
            required: true,
            multiple: true,
        },
        extra_fields:[
            {
                type: 'text_box',
                key: 'dimension',
                label: 'Dimensions',
                description: 'Crop images with dimension (widthxheight), sample:<br>400x300 | 400x | x300 | ?400x?500 | ?1400x (? => maximum, empty => auto)'
            }
        ]
    }
  end

  def e_shop_custom_product_page(args)

  end

  # add new slider for home page and remove previous structure
  def e_shop_add_main_slider
    unless current_theme.get_field_object('main_home_slider').present?
      current_theme.get_field_object('home_slider_tabs').try(:destroy)
      current_theme.get_field_object('home_slider_product').try(:destroy)
      current_theme.get_field_object('home_slider_bg').try(:destroy)

      group = current_theme.get_field_groups.where(slug: 'home_slider').first
      settings = {field_key: 'my_slider', multiple: true, required: true}
      group.add_field({name: t('e_shop.admin.slider.title', default: 'Home Slider'), slug: 'main_home_slider', description: t('e_shop.admin.slider.descr', default: 'Enter the slider items for the home page, sample: 1200x300')}, settings)
      current_theme.save_field_value('main_home_slider', [{image: current_site.the_url(locale:false)[0..-2] << theme_asset_url('images/banner_img.jpg'), title: 'One Click Installation', descr: 'Lorem Ipsum is simply dummy text of the ...'}.to_json, {image: current_site.the_url(locale:false)[0..-2] << theme_asset_url('images/banner_img.jpg'), title: 'Easy Configuration', descr: 'Lorem Ipsum is simply dummy text of ..'}.to_json])
    end
  end
end
