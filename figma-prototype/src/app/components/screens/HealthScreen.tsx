import React from 'react';
import { HealthScore } from '@/app/components/HealthScore';
import { Activity, Zap, Power, CheckCircle, AlertTriangle, Shield, Clock, Wrench } from 'lucide-react';

interface HealthMetricProps {
  label: string;
  score: number;
  status: 'good' | 'warning' | 'critical';
  icon: React.ReactNode;
  improvement?: string;
}

function HealthMetric({ label, score, status, icon, improvement }: HealthMetricProps) {
  const statusConfig = {
    good: { color: 'text-emerald-600', bg: 'bg-emerald-50', border: 'border-emerald-200' },
    warning: { color: 'text-amber-600', bg: 'bg-amber-50', border: 'border-amber-200' },
    critical: { color: 'text-red-600', bg: 'bg-red-50', border: 'border-red-200' },
  };

  const config = statusConfig[status];

  return (
    <div className={`rounded-xl border ${config.border} ${config.bg} p-4`}>
      <div className="flex items-center justify-between mb-3">
        <div className="flex items-center gap-2">
          <div className={`${config.color}`}>{icon}</div>
          <span className="text-slate-900">{label}</span>
        </div>
        <span className={`text-2xl ${config.color}`}>{score}%</span>
      </div>
      <div className="w-full bg-white rounded-full h-2 mb-2">
        <div 
          className={`h-2 rounded-full ${status === 'good' ? 'bg-emerald-500' : status === 'warning' ? 'bg-amber-500' : 'bg-red-500'}`}
          style={{ width: `${score}%` }}
        ></div>
      </div>
      {improvement && (
        <p className="text-xs text-slate-600 mt-2">{improvement}</p>
      )}
    </div>
  );
}

export function HealthScreen() {
  return (
    <div className="flex flex-col gap-6 pb-6">
      {/* Header */}
      <div className="bg-gradient-to-br from-slate-900 via-blue-900 to-slate-900 text-white p-6 rounded-b-3xl relative overflow-hidden">
        <div className="absolute inset-0 opacity-10">
          <div className="absolute bottom-0 left-0 w-32 h-32 border border-white rounded-full"></div>
        </div>
        <div className="relative z-10">
          <div className="flex items-center gap-2 mb-2">
            <Shield className="w-5 h-5 text-emerald-400" />
            <span className="text-xs text-emerald-400 uppercase tracking-wider">Predictive Monitoring</span>
          </div>
          <h1 className="text-2xl mb-1">System Health</h1>
          <p className="text-slate-300 text-sm">AI-powered diagnostics & longevity tracking</p>
        </div>
      </div>

      <div className="px-4 flex flex-col gap-5">
        {/* Value Prop: Longevity Story */}
        <div className="bg-gradient-to-r from-blue-500 to-blue-600 rounded-2xl p-5 text-white shadow-lg">
          <div className="flex items-start gap-3 mb-3">
            <div className="w-10 h-10 bg-white/20 rounded-xl flex items-center justify-center flex-shrink-0">
              <Clock className="w-5 h-5" />
            </div>
            <div>
              <h3 className="text-lg mb-1">Extended System Lifespan</h3>
              <p className="text-blue-50 text-sm leading-relaxed">
                Predictive maintenance and intelligent load management have extended your system's expected lifespan by <span className="text-white">2.4 years</span>.
              </p>
            </div>
          </div>
          <div className="flex items-center justify-between pt-3 border-t border-white/20">
            <span className="text-sm text-blue-50">Additional lifetime value:</span>
            <span className="text-xl">R8,960</span>
          </div>
        </div>

        {/* Overall Health Score */}
        <div className="bg-white rounded-2xl border border-slate-200 p-6 flex flex-col items-center shadow-sm">
          <div className="flex items-center justify-between w-full mb-2">
            <h3 className="text-slate-900">Overall System Health</h3>
            <div className="px-2 py-1 bg-emerald-50 text-emerald-700 rounded-lg text-xs">
              Excellent
            </div>
          </div>
          <p className="text-sm text-slate-500 mb-6 text-center">All critical systems operational</p>
          <HealthScore score={96} size="lg" />
          <div className="mt-6 w-full pt-6 border-t border-slate-200 space-y-2">
            <div className="flex items-center justify-center gap-2 text-emerald-600 mb-3">
              <CheckCircle className="w-5 h-5" />
              <span className="text-sm">Peak Performance Range</span>
            </div>
            <div className="grid grid-cols-2 gap-3 text-center text-sm">
              <div className="bg-slate-50 rounded-lg p-2">
                <div className="text-slate-600 text-xs">vs Installation</div>
                <div className="text-slate-900">-2% degradation</div>
                <div className="text-emerald-600 text-xs">Industry avg: -8%</div>
              </div>
              <div className="bg-slate-50 rounded-lg p-2">
                <div className="text-slate-600 text-xs">Projected @ 25yr</div>
                <div className="text-slate-900">88% capacity</div>
                <div className="text-emerald-600 text-xs">Industry avg: 80%</div>
              </div>
            </div>
          </div>
        </div>

        {/* Component Health Breakdown */}
        <div className="flex flex-col gap-3">
          <div className="flex items-center justify-between">
            <h3 className="text-slate-900">Component Intelligence</h3>
            <span className="text-xs text-slate-500">AI-monitored 24/7</span>
          </div>
          
          <HealthMetric
            label="Solar Panel Array"
            score={98}
            status="good"
            icon={<Activity className="w-5 h-5" />}
            improvement="Degradation 3.2x slower than industry average"
          />

          <HealthMetric
            label="Inverter Health"
            score={94}
            status="good"
            icon={<Zap className="w-5 h-5" />}
            improvement="AI thermal management extends lifespan +6 years"
          />

          <HealthMetric
            label="Power Quality"
            score={88}
            status="warning"
            icon={<Power className="w-5 h-5" />}
            improvement="Monitoring grid fluctuations, no action needed"
          />
        </div>

        {/* Intelligence Impact on Longevity */}
        <div className="bg-gradient-to-br from-emerald-50 to-white rounded-2xl border border-emerald-200 p-5">
          <div className="flex items-center gap-2 mb-4">
            <Shield className="w-5 h-5 text-emerald-600" />
            <h3 className="text-slate-900">How Intelligence Protects Your Investment</h3>
          </div>
          <div className="space-y-3">
            <div className="flex items-start gap-3 p-3 bg-white rounded-xl">
              <div className="w-8 h-8 rounded-lg bg-blue-100 flex items-center justify-center flex-shrink-0 mt-0.5">
                <Activity className="w-4 h-4 text-blue-600" />
              </div>
              <div className="flex-1">
                <div className="text-sm text-slate-900 mb-1">Stress Reduction</div>
                <p className="text-xs text-slate-600 mb-2">AI prevents 94% of damaging over-voltage events through real-time regulation.</p>
                <div className="flex items-center justify-between text-xs">
                  <span className="text-slate-500">Component wear reduced:</span>
                  <span className="text-emerald-600">18% vs standard</span>
                </div>
              </div>
            </div>
            
            <div className="flex items-start gap-3 p-3 bg-white rounded-xl">
              <div className="w-8 h-8 rounded-lg bg-emerald-100 flex items-center justify-center flex-shrink-0 mt-0.5">
                <Wrench className="w-4 h-4 text-emerald-600" />
              </div>
              <div className="flex-1">
                <div className="text-sm text-slate-900 mb-1">Predictive Maintenance</div>
                <p className="text-xs text-slate-600 mb-2">Early detection of degradation prevents catastrophic failures.</p>
                <div className="flex items-center justify-between text-xs">
                  <span className="text-slate-500">Repair costs avoided:</span>
                  <span className="text-emerald-600">R4,200 to date</span>
                </div>
              </div>
            </div>

            <div className="flex items-start gap-3 p-3 bg-white rounded-xl">
              <div className="w-8 h-8 rounded-lg bg-purple-100 flex items-center justify-center flex-shrink-0 mt-0.5">
                <Clock className="w-4 h-4 text-purple-600" />
              </div>
              <div className="flex-1">
                <div className="text-sm text-slate-900 mb-1">Thermal Management</div>
                <p className="text-xs text-slate-600 mb-2">Intelligent cooling patterns reduce heat stress on components.</p>
                <div className="flex items-center justify-between text-xs">
                  <span className="text-slate-500">Lifespan extension:</span>
                  <span className="text-purple-600">+2.4 years</span>
                </div>
              </div>
            </div>
          </div>
        </div>

        {/* System Diagnostics */}
        <div className="bg-white rounded-2xl border border-slate-200 p-5">
          <h3 className="text-slate-900 mb-4">Real-Time Diagnostics</h3>
          <div className="space-y-3">
            <div className="flex items-center justify-between p-3 bg-emerald-50 rounded-xl">
              <div className="flex items-center gap-3">
                <CheckCircle className="w-5 h-5 text-emerald-600" />
                <div>
                  <div className="text-sm text-slate-900">Panel Temperature</div>
                  <div className="text-xs text-slate-500">Optimal range • No stress</div>
                </div>
              </div>
              <div className="text-right">
                <div className="text-sm text-slate-900">42°C</div>
                <div className="text-xs text-emerald-600">-8% vs peak</div>
              </div>
            </div>

            <div className="flex items-center justify-between p-3 bg-emerald-50 rounded-xl">
              <div className="flex items-center gap-3">
                <CheckCircle className="w-5 h-5 text-emerald-600" />
                <div>
                  <div className="text-sm text-slate-900">DC Voltage</div>
                  <div className="text-xs text-slate-500">Stable • Optimized</div>
                </div>
              </div>
              <div className="text-right">
                <div className="text-sm text-slate-900">385V</div>
                <div className="text-xs text-slate-500">Within spec</div>
              </div>
            </div>

            <div className="flex items-center justify-between p-3 bg-amber-50 rounded-xl">
              <div className="flex items-center gap-3">
                <AlertTriangle className="w-5 h-5 text-amber-600" />
                <div>
                  <div className="text-sm text-slate-900">Grid Frequency</div>
                  <div className="text-xs text-slate-500">Minor variation • Monitoring</div>
                </div>
              </div>
              <div className="text-right">
                <div className="text-sm text-slate-900">59.8 Hz</div>
                <div className="text-xs text-amber-600">AI watching</div>
              </div>
            </div>

            <div className="flex items-center justify-between p-3 bg-emerald-50 rounded-xl">
              <div className="flex items-center gap-3">
                <CheckCircle className="w-5 h-5 text-emerald-600" />
                <div>
                  <div className="text-sm text-slate-900">Current Output</div>
                  <div className="text-xs text-slate-500">Peak efficiency</div>
                </div>
              </div>
              <div className="text-right">
                <div className="text-sm text-slate-900">4.2 kW</div>
                <div className="text-xs text-emerald-600">+8% optimized</div>
              </div>
            </div>
          </div>
        </div>

        {/* Proactive Warning */}
        <div className="bg-gradient-to-br from-amber-50 to-white rounded-2xl border border-amber-200 p-5">
          <div className="flex items-start gap-3">
            <AlertTriangle className="w-5 h-5 text-amber-600 flex-shrink-0 mt-0.5" />
            <div>
              <h4 className="text-slate-900 mb-2">Proactive Alert</h4>
              <div className="space-y-2 text-sm">
                <p className="text-slate-600">
                  Grid frequency fluctuations detected in the past 2 hours. Our AI is actively monitoring and will auto-disconnect if frequency drops below safety threshold (59.5 Hz).
                </p>
                <div className="pt-2 border-t border-amber-200">
                  <div className="flex items-center justify-between mb-1">
                    <span className="text-slate-600">Risk Level:</span>
                    <span className="text-amber-600">Low</span>
                  </div>
                  <div className="flex items-center justify-between">
                    <span className="text-slate-600">System Response:</span>
                    <span className="text-blue-600">Automated protection active</span>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>

        {/* Maintenance Intelligence */}
        <div className="bg-white rounded-2xl border border-slate-200 p-5">
          <div className="flex items-center justify-between mb-4">
            <h3 className="text-slate-900">Smart Maintenance Schedule</h3>
            <Wrench className="w-5 h-5 text-slate-600" />
          </div>
          <div className="space-y-3 text-sm">
            <div className="flex items-center justify-between pb-3 border-b border-slate-100">
              <span className="text-slate-600">Last AI Inspection</span>
              <span className="text-slate-900">2 minutes ago</span>
            </div>
            <div className="flex items-center justify-between pb-3 border-b border-slate-100">
              <span className="text-slate-600">Last Physical Service</span>
              <span className="text-slate-900">Dec 18, 2025</span>
            </div>
            <div className="flex items-center justify-between pb-3 border-b border-slate-100">
              <span className="text-slate-600">Next Scheduled Service</span>
              <span className="text-slate-900">Jun 18, 2026</span>
            </div>
            <div className="flex items-center justify-between pb-3 border-b border-slate-100">
              <span className="text-slate-600">AI-Recommended Cleaning</span>
              <span className="text-amber-600">In 14 days</span>
            </div>
            <div className="flex items-center justify-between pb-3 border-b border-slate-100">
              <span className="text-slate-600">System Uptime</span>
              <span className="text-emerald-600">99.8%</span>
            </div>
            <div className="flex items-center justify-between">
              <span className="text-slate-600">Unplanned Downtime</span>
              <span className="text-emerald-600">0 hours this year</span>
            </div>
          </div>
        </div>

        {/* Longevity Value Statement */}
        <div className="bg-gradient-to-br from-slate-900 to-blue-900 rounded-2xl p-5 text-white">
          <div className="flex items-center gap-2 mb-3">
            <Shield className="w-5 h-5 text-emerald-400" />
            <span className="text-emerald-400 text-sm uppercase tracking-wider">Longevity Advantage</span>
          </div>
          <p className="text-slate-100 text-sm mb-4">
            Ohwr's predictive intelligence has reduced component degradation by <span className="text-white">18%</span> and prevented <span className="text-emerald-400">R4,200</span> in repairs, extending your system's productive life to <span className="text-white">28.4 years</span> vs. industry standard of 26 years.
          </p>
          <div className="grid grid-cols-2 gap-3 pt-3 border-t border-white/20 text-sm">
            <div>
              <div className="text-slate-300 text-xs mb-1">Extra Years</div>
              <div className="text-lg">+2.4 years</div>
            </div>
            <div>
              <div className="text-slate-300 text-xs mb-1">Added Value</div>
              <div className="text-lg">R8,960</div>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}