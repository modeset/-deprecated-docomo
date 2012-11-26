<h1>Button Semigloss</h1>

<p>A semi-glossy button created via various mixins. By default, no classes are added to the style sheet unless told to do so.</p>
<div class="highlight"><pre><span class="k">@import</span> <span class="s">utensils/button_semigloss/button_semigloss</span>
</pre></div>
<h2>Usage Example</h2>

<div class="docomo-showcase"><section class='demo' data-remove='active error disabled' data-target='.btn'>
  <button class='btn'>Default</button>
  <button class='btn inverse'>Inverse</button>
  <button class='btn standard'>Standard</button>
  <button class='btn info'>Info</button>
  <button class='btn important'>Important</button>
  <button class='btn success'>Success</button>
  <button class='btn warning'>Warning</button>
  <button class='btn danger'>Danger</button>
  <button class='btn primary'>Primary</button>
</section>
<h5 style='margin-top:3em; margin-bottom:1em;'>Select to view states</h5>
<nav class='radio-demo button-group' data-bindable='toggle-button-group'>
  <a class='btn active' data-add='' href='#'>Normal</a>
  <a class='btn' data-add='active' href='#'>Active</a>
  <a class='btn' data-add='error' href='#'>Error</a>
  <a class='btn' data-add='disabled' href='#'>Disabled</a>
</nav>
</div>
<div class="highlight"><pre><span class="nt">%section</span><span class="nc">.demo</span>(<span class="na">data-target=</span><span class="s">&quot;.btn&quot;</span> <span class="na">data-remove=</span><span class="s">&quot;active error disabled&quot;</span>)
  <span class="nt">%button</span><span class="nc">.btn</span> Default
  <span class="nt">%button</span><span class="nc">.btn.inverse</span> Inverse
  <span class="nt">%button</span><span class="nc">.btn.standard</span> Standard
  <span class="nt">%button</span><span class="nc">.btn.info</span> Info
  <span class="nt">%button</span><span class="nc">.btn.important</span> Important
  <span class="nt">%button</span><span class="nc">.btn.success</span> Success
  <span class="nt">%button</span><span class="nc">.btn.warning</span> Warning
  <span class="nt">%button</span><span class="nc">.btn.danger</span> Danger
  <span class="nt">%button</span><span class="nc">.btn.primary</span> Primary

<span class="nt">%h5</span>(<span class="na">style=</span><span class="s">&quot;margin-top:3em; margin-bottom:1em;&quot;</span>) Select to view states
<span class="nt">%nav</span><span class="nc">.radio-demo.button-group</span>(<span class="na">data-bindable=</span><span class="s">&quot;toggle-button-group&quot;</span>)
  <span class="nt">%a</span><span class="nc">.btn.active</span>(<span class="na">href=</span><span class="s">&quot;#&quot;</span> <span class="na">data-add=</span><span class="s">&quot;&quot;</span>) Normal
  <span class="nt">%a</span><span class="nc">.btn</span>(<span class="na">href=</span><span class="s">&quot;#&quot;</span> <span class="na">data-add=</span><span class="s">&quot;active&quot;</span>) Active
  <span class="nt">%a</span><span class="nc">.btn</span>(<span class="na">href=</span><span class="s">&quot;#&quot;</span> <span class="na">data-add=</span><span class="s">&quot;error&quot;</span>) Error
  <span class="nt">%a</span><span class="nc">.btn</span>(<span class="na">href=</span><span class="s">&quot;#&quot;</span> <span class="na">data-add=</span><span class="s">&quot;disabled&quot;</span>) Disabled
</pre></div>
<p>The semigloss-button class can be applied to <code>&lt;a&gt;</code>, <code>&lt;button&gt;</code> and <code>&lt;input&gt;</code> elements.</p>

<div class="docomo-showcase"><section class='semigloss-btn-demo'>
  <a class='btn' href='#'>Link</a>
  <button class='btn' type='submit'>Button</button>
  <input class='btn' type='button' value='Input' />
  <input class='btn' type='submit' value='Submit' />
</section>
</div>
<div class="highlight"><pre><span class="nt">%section</span><span class="nc">.semigloss-btn-demo</span>
  <span class="nt">%a</span><span class="nc">.btn</span>(<span class="na">href=</span><span class="s">&quot;#&quot;</span>) Link
  <span class="nt">%button</span><span class="nc">.btn</span>(<span class="na">type=</span><span class="s">&quot;submit&quot;</span>) Button
  <span class="nt">%input</span><span class="nc">.btn</span>(<span class="na">type=</span><span class="s">&quot;button&quot;</span> <span class="na">value=</span><span class="s">&quot;Input&quot;</span>)
  <span class="nt">%input</span><span class="nc">.btn</span>(<span class="na">type=</span><span class="s">&quot;submit&quot;</span> <span class="na">value=</span><span class="s">&quot;Submit&quot;</span>)
</pre></div>
<h2>Options</h2>

<p>Semigloss button contains 3 mixins.</p>

<h3>Mixin: <code>semigloss-button</code></h3>

<p>Generates the base class for modifiers to extend.</p>

<table><thead>
<tr>
<th>Parameter</th>
<th>Default</th>
<th>Description</th>
</tr>
</thead><tbody>
<tr>
<td><code>$bg</code></td>
<td><em>none</em></td>
<td>This is a required parameter</td>
</tr>
<tr>
<td><code>$color</code></td>
<td><code>#fff</code></td>
<td>The text <code>color</code></td>
</tr>
<tr>
<td><code>$hover-percent</code></td>
<td><code>10%</code></td>
<td>The percentage to darken the <code>background-color</code> on hover</td>
</tr>
<tr>
<td><code>$active-percent</code></td>
<td><code>15%</code></td>
<td>The percentage to darken the <code>background-color</code> on press and <code>.active</code></td>
</tr>
<tr>
<td><code>$border-percent</code></td>
<td><code>30%</code></td>
<td>The percentage to darken the <code>border-color</code> against <code>$bg</code></td>
</tr>
<tr>
<td><code>$padding</code></td>
<td><code>$base-padding</code></td>
<td>The <code>padding</code> within the button</td>
</tr>
<tr>
<td><code>$radii</code></td>
<td><code>$radii</code></td>
<td>The button&#39;s <code>border-radius</code></td>
</tr>
</tbody></table>
<div class="highlight"><pre><span class="nc">.btn</span>
  <span class="nd">+semigloss-button</span><span class="p">(</span><span class="nv">$body-bgc</span><span class="o">,</span> <span class="nv">$link-color</span><span class="p">)</span>
</pre></div>
<h3>Mixin: <code>semigloss-button-modifier</code></h3>

<p>Generates the modifier classes from the base class. This limits the
amount of output for a given button.</p>

<table><thead>
<tr>
<th>Parameter</th>
<th>Default</th>
<th>Description</th>
</tr>
</thead><tbody>
<tr>
<td><code>$bg</code></td>
<td><em>none</em></td>
<td>This is a required parameter</td>
</tr>
<tr>
<td><code>$color</code></td>
<td><code>#fff</code></td>
<td>The text <code>color</code> to override from the base button</td>
</tr>
<tr>
<td><code>$hover-percent</code></td>
<td><code>10%</code></td>
<td>The percentage to darken the <code>background-color</code> on hover</td>
</tr>
<tr>
<td><code>$active-percent</code></td>
<td><code>12.5%</code></td>
<td>The percentage to darken the <code>background-color</code> on press and <code>.active</code></td>
</tr>
<tr>
<td><code>$border-percent</code></td>
<td><code>15%</code></td>
<td>The percentage to darken the <code>border-color</code> against <code>$bg</code></td>
</tr>
</tbody></table>
<div class="highlight"><pre><span class="nc">.btn</span>
  <span class="k">&amp;</span><span class="nc">.important</span>
    <span class="nd">+semigloss-button-modifier</span><span class="p">(</span><span class="nv">$important</span><span class="o">,</span> <span class="nv">$white</span><span class="p">)</span>
  <span class="k">&amp;</span><span class="nc">.success</span>
    <span class="nd">+semigloss-button-modifier</span><span class="p">(</span><span class="nv">$success</span><span class="o">,</span> <span class="nv">$white</span><span class="p">)</span>
  <span class="k">&amp;</span><span class="nc">.warning</span>
    <span class="nd">+semigloss-button-modifier</span><span class="p">(</span><span class="nv">$warning</span><span class="o">,</span> <span class="nv">$white</span><span class="p">)</span>
</pre></div>
<h3>Mixin: <code>generate-semigloss-buttons</code></h3>

<p>Generates the base class and modifier classes from the list directly to
the style sheet.</p>

<table><thead>
<tr>
<th>Parameter</th>
<th>Default</th>
<th>Description</th>
</tr>
</thead><tbody>
<tr>
<td><code>$name</code></td>
<td><em>none</em></td>
<td>The base class name to call it (<code>btn</code>, <code>action</code>, ...), required parameter</td>
</tr>
<tr>
<td><code>$list</code></td>
<td><em>none</em></td>
<td>A <code>list</code> of named status classes, passing an empty list does not generate any modifiers</td>
</tr>
</tbody></table>
<div class="highlight"><pre><span class="nd">+generate-semigloss-buttons</span><span class="p">(</span><span class="n">btn</span><span class="o">,</span> <span class="nv">$base-level-list</span><span class="p">)</span>

<span class="c1">// results in styles for..</span>
<span class="nc">.btn</span>
  <span class="c1">// styles...</span>

<span class="nc">.btn.important</span>
  <span class="c1">// modified styles...</span>

<span class="nc">.btn.success</span>
  <span class="c1">// modified styles...</span>

<span class="nc">.btn.warning</span>
  <span class="c1">// modified styles...</span>

<span class="nc">.btn.danger</span>
  <span class="c1">// modified styles...</span>
</pre></div>
<p>The base class (in these cases <code>.btn</code>) adds all of the necessary
properties to render a button. The modifiers (<code>.success</code>, <code>.important</code>)
mainly override the color values for various states. To keep the output
as small as possible, just mixin or generate the states needed within the
project or application.</p>

<h4>Auto Generation</h4>

<p>To auto generate buttons into the style sheet, within <code>config.sass</code> add
the following:</p>
<div class="highlight"><pre><span class="na">$auto-generate-semigloss</span><span class="o">:</span> <span class="n">btn</span><span class="o">,</span> <span class="nv">$base-status-list</span>
</pre></div>
<p>This will create a base button with the class of <code>.btn</code> and
modifiers for each of the elements within the <code>$base-status-list</code>. By
default this is set to <code>false</code> so no buttons are created.</p>

<h2>Todo:</h2>

<ul>
<li>This is a bit wordy.. document how lists in sass work somewhere else</li>
<li>The sass file could use a little cleaning.</li>
</ul>
