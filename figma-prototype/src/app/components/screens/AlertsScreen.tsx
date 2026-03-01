import React, { useState } from 'react';
import { AlertItem } from '@/app/components/AlertItem';
import { Bell, AlertTriangle, Info, Shield, XCircle } from 'lucide-react';

const alerts = [
  {
    severity: 'critical' as const,
    title: 'Power Quality Anomaly Detected',
    description: 'Voltage fluctuation outside safe operating range detected in grid supply.',
    timestamp: '45min ago',
    whyMatters: 'Unstable voltage can damage inverter components and reduce system lifespan by up to 3 years.',
    estimatedImpact: 'R12,400 equipment risk',
  },
  {
    severity: 'critical' as const,
    title: 'Significant Underperformance',
    description: 'Northwest panel array output is 18% below expected. Possible panel soiling or shading.',
    timestamp: '2h ago',
    whyMatters: 'Each day of underperformance costs R18 in lost revenue and delays your ROI timeline.',
    estimatedImpact: 'R540/month revenue loss',
  },
  {
    severity: 'warning' as const,
    title: 'Battery Discharge Depth Alert',
    description: 'Battery discharged below optimal 80% threshold twice this week.',
    timestamp: '4h ago',
    whyMatters: 'Deep discharges accelerate battery degradation, potentially reducing lifespan by 6-12 months.',
    estimatedImpact: '240 cycles at risk',
  },
  {
    severity: 'warning' as const,
    title: 'Inverter Temperature Elevated',
    description: 'Inverter operating temperature reached 68°C. Within safe limits but elevated.',
    timestamp: '1d ago',
    whyMatters: 'Sustained high temps reduce inverter efficiency and can shorten equipment life.',
    estimatedImpact: '2-3% efficiency loss',
  },
  {
    severity: 'info' as const,
    title: 'AI Optimization Successful',
    description: 'Battery charge cycle adjusted based on tomorrow\'s weather forecast.',
    timestamp: '3h ago',
    whyMatters: 'Proactive adjustments maximize savings and extend battery health.',
    estimatedImpact: '+R12 estimated savings',
  },
  {
    severity: 'info' as const,
    title: 'Peak Production Achieved',
    description: 'Your system reached 98% of maximum rated capacity today at 12:45 PM.',
    timestamp: '6h ago',
    whyMatters: 'High-efficiency days validate your system is properly maintained and optimized.',
    estimatedImpact: 'On track for target ROI',
  },
  {
    severity: 'info' as const,
    title: 'Monthly Report Available',
    description: 'Your January performance summary is ready to view.',
    timestamp: '2d ago',
    whyMatters: 'Regular reporting helps track progress toward your energy independence goals.',
    estimatedImpact: 'Review insights',
  },
];

export function AlertsScreen() {
  const [filter, setFilter] = useState<'all' | 'critical' | 'warning' | 'info'>('all');

  const criticalAlerts = alerts.filter(a => a.severity === 'critical');
  const warningAlerts = alerts.filter(a => a.severity === 'warning');
  const infoAlerts = alerts.filter(a => a.severity === 'info');

  const filteredAlerts = 
    filter === 'all' ? alerts :
    filter === 'critical' ? criticalAlerts :
    filter === 'warning' ? warningAlerts :
    infoAlerts;

  return (
    <div className="flex flex-col gap-6 pb-6">
      {/* Header */}
      <div className="bg-gradient-to-br from-slate-900 via-slate-800 to-blue-900 text-white p-6 rounded-b-3xl">
        <div className="flex items-start justify-between mb-4">
          <div>
            <div className="flex items-center gap-2 mb-1">
              <Shield className="w-5 h-5 text-blue-400" />
              <span className="text-xs text-blue-400 uppercase tracking-wider">Anomaly Detection</span>
            </div>
            <h1 className="text-2xl mb-1">Alerts & Monitoring</h1>
            <p className="text-slate-300 text-sm">AI-powered issue detection & insights</p>
          </div>
          <Bell className="w-8 h-8" />
        </div>
        
        {/* Alert Summary Banner */}
        <div className="bg-white/10 backdrop-blur-sm rounded-xl p-4 border border-white/20">
          <div className="flex items-center justify-between mb-3">
            <span className="text-sm text-slate-200">Alert Summary</span>
            <span className="text-xs text-slate-300">{alerts.length} total</span>
          </div>
          <div className="grid grid-cols-3 gap-2">
            <div className="bg-red-500/20 border border-red-400/30 rounded-lg p-2">
              <div className="text-red-200 text-xs mb-0.5">Critical</div>
              <div className="text-white text-xl">{criticalAlerts.length}</div>
            </div>
            <div className="bg-amber-500/20 border border-amber-400/30 rounded-lg p-2">
              <div className="text-amber-200 text-xs mb-0.5">Warning</div>
              <div className="text-white text-xl">{warningAlerts.length}</div>
            </div>
            <div className="bg-blue-500/20 border border-blue-400/30 rounded-lg p-2">
              <div className="text-blue-200 text-xs mb-0.5">Info</div>
              <div className="text-white text-xl">{infoAlerts.length}</div>
            </div>
          </div>
        </div>
      </div>

      {/* Filter Tabs */}
      <div className="px-4">
        <div className="flex gap-2 bg-slate-100 p-1 rounded-xl">
          <button 
            onClick={() => setFilter('all')}
            className={`flex-1 py-2 px-4 rounded-lg text-sm transition-all ${
              filter === 'all' ? 'bg-white text-slate-900 shadow' : 'text-slate-600'
            }`}
          >
            All ({alerts.length})
          </button>
          <button 
            onClick={() => setFilter('critical')}
            className={`flex-1 py-2 px-4 rounded-lg text-sm transition-all ${
              filter === 'critical' ? 'bg-white text-slate-900 shadow' : 'text-slate-600'
            }`}
          >
            Critical ({criticalAlerts.length})
          </button>
          <button 
            onClick={() => setFilter('warning')}
            className={`flex-1 py-2 px-4 rounded-lg text-sm transition-all ${
              filter === 'warning' ? 'bg-white text-slate-900 shadow' : 'text-slate-600'
            }`}
          >
            Warnings ({warningAlerts.length})
          </button>
        </div>
      </div>

      {/* Critical Alerts Section */}
      {(filter === 'all' || filter === 'critical') && criticalAlerts.length > 0 && (
        <div className="px-4">
          <div className="flex items-center gap-2 mb-3">
            <XCircle className="w-5 h-5 text-red-600" />
            <h2 className="text-slate-900 font-medium">Critical Issues</h2>
            <span className="px-2 py-0.5 bg-red-100 text-red-700 rounded-full text-xs">
              Immediate attention required
            </span>
          </div>
          <div className="space-y-3">
            {criticalAlerts.map((alert, index) => (
              <div key={index} className="bg-white rounded-xl border-2 border-red-200 overflow-hidden">
                <AlertItem
                  severity={alert.severity}
                  title={alert.title}
                  description={alert.description}
                  timestamp={alert.timestamp}
                />
                <div className="px-4 pb-4 bg-red-50 border-t border-red-100">
                  <div className="flex items-start gap-2 pt-3">
                    <Info className="w-4 h-4 text-red-600 flex-shrink-0 mt-0.5" />
                    <div className="flex-1">
                      <div className="text-xs font-medium text-red-900 mb-1">Why this matters:</div>
                      <p className="text-xs text-red-800 mb-2">{alert.whyMatters}</p>
                      <div className="text-xs text-red-700 font-medium">{alert.estimatedImpact}</div>
                    </div>
                  </div>
                </div>
              </div>
            ))}
          </div>
        </div>
      )}

      {/* Warning Alerts Section */}
      {(filter === 'all' || filter === 'warning') && warningAlerts.length > 0 && (
        <div className="px-4">
          <div className="flex items-center gap-2 mb-3">
            <AlertTriangle className="w-5 h-5 text-amber-600" />
            <h2 className="text-slate-900 font-medium">Warnings</h2>
            <span className="px-2 py-0.5 bg-amber-100 text-amber-700 rounded-full text-xs">
              Monitor closely
            </span>
          </div>
          <div className="space-y-3">
            {warningAlerts.map((alert, index) => (
              <div key={index} className="bg-white rounded-xl border border-amber-200 overflow-hidden">
                <AlertItem
                  severity={alert.severity}
                  title={alert.title}
                  description={alert.description}
                  timestamp={alert.timestamp}
                />
                <div className="px-4 pb-4 bg-amber-50 border-t border-amber-100">
                  <div className="flex items-start gap-2 pt-3">
                    <Info className="w-4 h-4 text-amber-600 flex-shrink-0 mt-0.5" />
                    <div className="flex-1">
                      <div className="text-xs font-medium text-amber-900 mb-1">Why this matters:</div>
                      <p className="text-xs text-amber-800 mb-2">{alert.whyMatters}</p>
                      <div className="text-xs text-amber-700 font-medium">{alert.estimatedImpact}</div>
                    </div>
                  </div>
                </div>
              </div>
            ))}
          </div>
        </div>
      )}

      {/* Info Alerts Section */}
      {(filter === 'all' || filter === 'info') && infoAlerts.length > 0 && (
        <div className="px-4">
          <div className="flex items-center gap-2 mb-3">
            <Info className="w-5 h-5 text-blue-600" />
            <h2 className="text-slate-900 font-medium">Informational</h2>
            <span className="px-2 py-0.5 bg-blue-100 text-blue-700 rounded-full text-xs">
              FYI
            </span>
          </div>
          <div className="space-y-3">
            {infoAlerts.map((alert, index) => (
              <div key={index} className="bg-white rounded-xl border border-slate-200 overflow-hidden">
                <AlertItem
                  severity={alert.severity}
                  title={alert.title}
                  description={alert.description}
                  timestamp={alert.timestamp}
                />
                <div className="px-4 pb-4 bg-blue-50 border-t border-blue-100">
                  <div className="flex items-start gap-2 pt-3">
                    <Info className="w-4 h-4 text-blue-600 flex-shrink-0 mt-0.5" />
                    <div className="flex-1">
                      <div className="text-xs font-medium text-blue-900 mb-1">Why this matters:</div>
                      <p className="text-xs text-blue-800 mb-2">{alert.whyMatters}</p>
                      <div className="text-xs text-blue-700 font-medium">{alert.estimatedImpact}</div>
                    </div>
                  </div>
                </div>
              </div>
            ))}
          </div>
        </div>
      )}

      {/* Empty State */}
      {filteredAlerts.length === 0 && (
        <div className="px-4">
          <div className="text-center py-12 bg-slate-50 rounded-2xl">
            <div className="w-16 h-16 bg-slate-100 rounded-full flex items-center justify-center mx-auto mb-4">
              <Bell className="w-8 h-8 text-slate-400" />
            </div>
            <p className="text-slate-600">No alerts in this category</p>
          </div>
        </div>
      )}

      {/* Anomaly Detection Info */}
      <div className="px-4">
        <div className="bg-gradient-to-br from-blue-50 to-slate-50 rounded-2xl border border-blue-200 p-5">
          <div className="flex items-center gap-2 mb-3">
            <Shield className="w-5 h-5 text-blue-600" />
            <h3 className="text-slate-900">AI Anomaly Detection</h3>
          </div>
          <p className="text-sm text-slate-700 leading-relaxed mb-3">
            Ohwr's AI continuously monitors 40+ system parameters, comparing them against expected performance patterns to detect issues before they become costly problems.
          </p>
          <div className="grid grid-cols-2 gap-3 pt-3 border-t border-blue-200">
            <div>
              <div className="text-blue-900 font-medium">94.2%</div>
              <div className="text-xs text-slate-600">Detection Accuracy</div>
            </div>
            <div>
              <div className="text-blue-900 font-medium">2.4 hrs</div>
              <div className="text-xs text-slate-600">Avg Response Time</div>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}