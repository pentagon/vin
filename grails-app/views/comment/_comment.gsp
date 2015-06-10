<script id="comment_template" type="x-tmpl-mustache">
<div class="panel panel-default">
  <div class="panel-heading">
    <div class="row panel-title">
      <div class="col-lg-12">
        <div class="pull-left">
          <h3 class="panel-title">{{ user.username }}</h3>
        </div>

        <div class="pull-right">
          <h3 class="panel-title">{{ dateCreated }}</h3>
        </div>
      </div>
    </div>
  </div>

  <div class="panel-body">
    <div class="row">
      <div class="col-lg-12">
        {{ body }}
      </div>
    </div>
  </div>
</div>
</script>
