<%
  def pages = Math.ceil(count / max) as Integer
  def prev = offset - max > 0 ? offset - max : 0
  def next = offset + max < count ? offset + max : offset
%>
<nav>
  <ul class="pagination">
    <li>
      <g:link controller="${controllerName}" action="index" params="[offset: prev]" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
      </g:link>
    </li>
    <g:each in="${(0..pages - 1)}" var="p">
      <li ${offset == p * max ? 'class=active' : ''}>
        <g:link controller="${controllerName}" action="index" params="[offset: max * p]">
          ${p + 1}
        </g:link>
      </li>
    </g:each>
    <li>
      <g:link controller="${controllerName}" action="index" params="[offset: next]" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
      </g:link>
    </li>
  </ul>
</nav>


